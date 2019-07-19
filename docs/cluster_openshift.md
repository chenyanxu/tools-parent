## command
```
ansible all -m service -a 'name=firewalld state=stopped  enabled=no'
ansible all -m yum -a 'name=wget,git,net-tools,bind-utils,iptables-services,bridge-utils,bash-completion,kexec-tools,sos,psacct,openssl-devel,zile,nano,openssl-devel,httpd-tools,NetworkManager,python-cryptography,python2-pip,python-devel,python-passlib,java-1.8.0-openjdk-headless'
ansible all -m yum -a 'name="@Development Tools"'
ansible all -m yum -a 'name=docker-1.13.1'
ansible all -m yum -a 'name=lrzsz,ntpdate,sysstat,dos2unix,telnet,tree,vim' 
```
```

ansible all  -m shell -a 'echo 'export LANG="en_US.UTF-8"' >> /etc/profile'
ansible all  -m shell -a "sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config &&  setenforce 0"
ansible all -m service -a 'name=firewalld state=stopped  enabled=no'
ansible all -m service -a 'name=docker state=started  enabled=yes'
ansible all  -m shell -a "sed -i "s#keepcache=0#keepcache=1#g" /etc/yum.conf"

ansible all -m shell -a 'tee /etc/docker/daemon.json<<-'EOF'
{ 
"registry-mirrors": ["https://npf9aw3v.mirror.aliyuncs.com"]
}
    EOF'

ansible all -m service -a "name=docker state=restarted  enabled=yes"

ansible all  -m shell -a 'ulimit -SHn 65535'
ansible all  -m shell -a "echo '* - nofile 65535' >>/etc/security/limits.conf"
ansible all  -m shell -a "echo '*/5 * * * * /usr/sbin/ntpdate ntp1.aliyun.com >/dev/null 2 >&1' >>/var/spool/cron/root"
ansible all  -m shell -a "ntpdate ntp1.aliyun.com &&hwclock -w"
ansible all  -m shell -a "echo 1 > /proc/sys/net/ipv4/ip_forward"
ansible all  -m shell -a "sysctl -w net.ipv4.ip_forward=1"
ansible all  -m shell -a "systemctl stop postfix && systemctl disable postfix "
```
## docker master,infra pull
```
 ansible master,infra -m shell -a "docker pull docker.io/openshift/origin-web-console:v3.9.0"
 ansible master,infra -m shell -a "docker pull docker.io/openshift/origin-haproxy-router:v3.9.0"
 ansible master,infra -m shell -a "docker pull docker.io/openshift/origin-deployer:v3.9.0"
 ansible master,infra -m shell -a "docker pull docker.io/openshift/origin-pod:v3.9.0"
 ansible master,infra -m shell -a "docker pull docker.io/cockpit/kubernetes:latest"
 ansible master,infra -m shell -a "docker pull docker.io/heketi/heketi:latest"
 ansible master,infra -m shell -a "docker pull docker.io/openshift/origin-docker-registry:v3.9.0"
```

## docker node pull
```
ansible node -m shell -a "docker pull docker.io/openshift/origin-pod:v3.9.0"
ansible node -m shell -a "docker pull docker.io/openshift/origin-docker-builder:v3.9.0"

```

## inventory.ini

```
[OSEv3:children]
masters
nodes
etcd

[masters]
# 如果要想直接dns好用这里都是用路由线路的ip地址作为安装线路 也可以像我这样后改dns来避免都在一个网卡上的瓶颈
# openshift_ip=172.16.5.131 就是etcd要监听的地址 他和下面配置一个就可以用来决定关键服务走什么线路的网络设备
# openshift_hostname=master-39-1 就是服务器对外提供服务的解析地址要和/etc/hosts对好
master-1 openshift_ip=172.16.5.49
master-2 openshift_ip=172.16.5.22
master-3 openshift_ip=172.16.5.23

[etcd]
master-1 openshift_ip=172.16.5.49
master-2 openshift_ip=172.16.5.22
master-2 openshift_ip=172.16.5.23

[nodes]
# openshift_ip=172.16.5.131 用来指定os内部监听地址线路不然就会是默认路由线路
# infra   是平台系统工作节点 一般放 路由|仓库|监控|日志等系统组件功能属于基础平台节点
# primary 是普通的apps工作平台节点
# openshift_schedulable=False 是不让该节点参与apps的任务调度 
master-1 openshift_ip=172.16.5.49 
master-2 openshift_ip=172.16.5.22 
master-3 openshift_ip=172.16.5.23 
node-1   openshift_ip=172.16.5.26 openshift_node_labels="{'region': 'primary', 'zone': 'default'}"
node-2   openshift_ip=172.16.5.28 openshift_node_labels="{'region': 'primary', 'zone': 'default'}"
node-3   openshift_ip=172.16.5.32 openshift_node_labels="{'region': 'primary', 'zone': 'default'}"
infra-1 openshift_ip=172.16.5.33 openshift_node_labels="{'region': 'infra', 'zone': 'default'}" 
infra-2 openshift_ip=172.16.5.34 openshift_node_labels="{'region': 'infra', 'zone': 'default'}" 

[OSEv3:vars]
ansible_ssh_user=root
#deployment_type=openshift-enterprise
deployment_type=origin
openshift_deployment_type=origin
openshift_release=v3.9
# 高可用开关
openshift_master_cluster_method=native
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/master/htpasswd'}]
# 注意这里的配合根据自己硬件和项目来设定保留 处理器留1核内存16GB就可以了
# 下面是 可以使用10个处理器 node接单最大250个pods
openshift_node_kubelet_args={'pods-per-core': ['10'], 'max-pods': ['250'], 'image-gc-high-threshold': ['85'], 'image-gc-low-threshold': ['75']}
os_sdn_network_plugin_name='redhat/openshift-ovs-multitenant'
openshift_disable_check=disk_availability,docker_storage,memory_availability,docker_image_availability
osm_use_cockpit=true
openshift_clock_enabled=true

openshift_enable_service_catalog=false
openshift_service_catalog_image_version=v3.9.0
#这里关闭它要不需要改写模板 ./roles/template_service_broker/tasks/deploy.yml 51行，后面有说明
#template_service_broker_install=false
template_service_broker_image_version=v3.9.0
template_service_broker_selector={"region":"infra"}

openshift_metrics_install_metrics=true
openshift_metrics_image_version="v3.9"
openshift_logging_install_logging=true
openshift_logging_image_version="v3.9"

# Native high availability cluster method with optional load balancer.
# If no lb group is defined installer assumes that a load balancer has 
# been preconfigured. For installation the value of 
#下面这一句最重要 指定这个属性为load balancer的地址名作为解析负载均衡(高可用需注意这里)
# openshift_master_cluster_hostname must resolve to the load balancer 
# 下面这句是如果是单机Master时是可以设置为主机名作为负载均衡器
# or to one or all of the masters defined in the inventory if no load 
# balancer is present.

# 集群管理入口(公网) 
openshift_master_cluster_public_hostname=3icity.xcloudiot.com      
# 域网管理API入口(域网)这里使用高可用Master因此需要设置为LB名
# openshift_master_cluster_hostname=lb.3icity.xcloudiot.com          
# 产品路由域名(产品)
openshift_master_default_subdomain=apps.xcloudiot.com

openshift_master_api_port=8443
openshift_master_console_port=8443
# 默认是0 永不超时
openshift_web_console_inactivity_timeout_minutes=30                 


osm_default_node_selector='region=primary'
openshift_router_selector='region=infra'
openshift_registry_selector='region=infra'

```

## install ansible 2.4.3.0
```
 yum install python-pip python-dev
 
  pip install ansible==2.4.3.0

```


# 修改docker存储类型
[root@master-39-1 ~]# vim  /etc/sysconfig/docker-storage
DOCKER_STORAGE_OPTIONS="--storage-driver devicemapper --storage-opt dm.fs=xfs --storage-opt"
[root@master-39-1 ~]#  reboot

## metric
```
 ansible-playbook -i inventory.ini openshift-ansible/playbooks/openshift-metrics/config.yml \
 -e openshift_metrics_install_metrics=True \
 -e openshift_metrics_image_version=v3.9 \
 -e openshift_metrics_hawkular_hostname=metrics.3icity.xcloudiot.com \
 -e openshift_metrics_duration=1 \
 -e openshift_metrics_resolution='30s'
 
 ansible-playbook -i inventory.ini openshift-ansible/playbooks/openshift-metrics/config.yml \
 -e openshift_metrics_install_metrics=False

```

### nfs 
https://www.centos.bz/2017/12/nfs%E8%AE%BE%E7%BD%AE%E5%9B%BA%E5%AE%9A%E7%AB%AF%E5%8F%A3%E5%B9%B6%E6%B7%BB%E5%8A%A0%E9%98%B2%E7%81%AB%E5%A2%99%E8%A7%84%E5%88%99/
```
[root@master-1 ~]# iptables -I INPUT -m state --state NEW -p tcp -m multiport --dport 30001:30004 -s 0.0.0.0/0 -j ACCEPT
[root@master-1 ~]# iptables -I INPUT -m state --state NEW -p udp -m multiport --dport 30001:30004 -s 0.0.0.0/0 -j ACCEPT
[root@master-1 ~]# service iptables save
```