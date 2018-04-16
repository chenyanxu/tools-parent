## ceph和openshift安装

#### 准备工作
三台centos7.0（本例中为7.3）以上系统 例如:

 139.196.0.1 (内网:10.174.156.213)  （master）
 
 139.196.0.2  （内网:10.174.70.232） （node1）
 
 139.196.0.3  （内网:10.47.83.244） （node2）

#### 修改hostname和hosts

*** 登录139.196.0.1修改hostname ***

```
 $ hostnamectl set-hostname master
```

*** 登录139.196.0.2修改hostname ***

```
 $ hostnamectl set-hostname node1 
```

*** 登录139.196.0.3修改hostname ***

```
 $ hostnamectl set-hostname node2
```

*** 分别修改每台机器的/etc/hosts 内容如下 ***

```
10.174.156.213  master
10.174.70.232   node1
10.47.83.244    node2
```

#### 实现master对node的免密登录

*** 分别在每台服务器上创建qiyunxin用户和设置密码 ***

```
$ sudo useradd -d /home/qiyunxin -m qiyunxin
$ sudo passwd qiyunxin
$ echo "qiyunxin ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/qiyunxin
$ sudo chmod 0440 /etc/sudoers.d/qiyunxin
```
```
//执行sudo visudo 找到 Defaults requiretty 选项（如果有的话,没有的话不需要修改）把它改为 Defaults:ceph !requiretty 或者直接注释掉
$ sudo visudo 
```


*** 以qiyunxin身份登录到master节点上 ***

```
$ ssh-keygen (一直按回车)
$ ssh-copy-id qiyunxin@master
$ ssh-copy-id qiyunxin@node1
$ ssh-copy-id qiyunxin@node2
$ sudo vi ~/.ssh/config
Host 10.174.156.213
   Hostname master
   User qiyunxin
Host 10.174.70.232
   Hostname node1
   User qiyunxin
Host 10.47.83.244
   Hostname node2
   User qiyunxin
```
如果用 ssh master,ssh node1,ssh node2 分别无需密码登录上去 那么表示设置成功了。

*** 禁用所有节点的selinux（设置完后重启各节点） ***

```
$ sudo vi /etc/selinux/config
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of three two values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected. 
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
```

设置完后重启服务器

#### 安装ceph

*** 包安装 （master节点） ***

```
(此命令最好每个node都执行下，不执行有时会出现yum包依赖错误)
$ sudo yum install -y yum-utils && sudo yum-config-manager --add-repo https://dl.fedoraproject.org/pub/epel/7/x86_64/ && sudo yum install --nogpgcheck -y epel-release && sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && sudo rm /etc/yum.repos.d/dl.fedoraproject.org*

$ sudo vim /etc/yum.repos.d/ceph.repo
[Ceph-noarch]
name=Ceph noarch packages
baseurl=http://mirrors.aliyun.com/ceph/rpm-jewel/el7/noarch
enabled=1
gpgcheck=1
type=rpm-md
gpgkey=https://mirrors.aliyun.com/ceph/keys/release.asc
priority=1

$ sudo yum -y  update && sudo yum install -y ceph-deploy

```
如果下载不下来或者速度慢 请参考http://www.cnblogs.com/bodhitree/p/5993722.html
(
export CEPH_DEPLOY_REPO_URL=http://mirrors.aliyun.com/ceph/rpm-jewel/el7
export CEPH_DEPLOY_GPG_URL=http://mirrors.aliyun.com/ceph/keys/release.asc
)

*** CEPH节点安装 ***

分别登录master,node1,node2 执行如下命令

```
$ sudo yum install ntp ntpdate ntp-doc

```

打开防火墙对应的端口

```
$ sudo iptables -I INPUT -p tcp --dport 6800:7300 -j ACCEPT
$ sudo iptables -I INPUT -p tcp --dport 6789 -j ACCEPT
$ sudo service iptables save
```


*** ceph安装 ***

登入master

```
$ mkdir ~/my-cluster
$ cd ~/my-cluster
```

创建集群

```
$ ceph-deploy new master
$ df -T
//如果您的文件系统是ext4或xfs的需要在 vi ~/my-cluster/ceph.conf加入配置
$ vi ~/my-cluster/ceph.conf
rbd_default_features = 1
filestore xattr use omap = true
osd max object name len = 256
osd max object namespace len = 64

$ ceph-deploy install master master node1 node2  (注意是两个master)
$ ceph-deploy mon create-initial

$ sudo ssh master
$ sudo mkdir /mnt/osd0
$ sudo chown ceph:ceph /mnt/osd0
$ exit

$ ssh node1
$ sudo mkdir /mnt/osd1
$ sudo chown ceph:ceph /mnt/osd1
$ exit

$ ssh node2
$ sudo mkdir /mnt/osd2
$ sudo chown ceph:ceph /mnt/osd2
$ exit

$ ceph-deploy osd prepare master:/mnt/osd0 node1:/mnt/osd1 node2:/mnt/osd2
$ ceph-deploy osd activate master:/mnt/osd0 node1:/mnt/osd1 node2:/mnt/osd2
$ ceph-deploy admin master master node1 node2
$ sudo chmod +r /etc/ceph/ceph.client.admin.keyring
$ ceph health

显示 HEALTH_OK 表示成功

有可能出现的错误：

ceph安装时报错RuntimeError: NoSectionError


 问题列表：
 http://blog.csdn.net/sinat_36023271/article/details/52402028

```

（
备注: 新增OSD
cd ~/my-cluster
ceph-deploy osd prepare master:/home/osd3
ceph-deploy osd activate master:/home/osd3
）

*** 文件存储（master上操作） ***

```
$ cd ~/my-cluster
$ ceph-deploy --overwrite-conf mds create master
$ ceph osd pool create cephfs_data 64
$ ceph osd pool create cephfs_metadata 64
$ ceph fs new cephfs cephfs_metadata cephfs_data

```

#### openshift 安装

*** NetworkManager安装（各节点上） ***

```
 $ sudo yum install -y NetworkManager
 $ sudo systemctl start NetworkManager 
 $ sudo systemctl enable NetworkManager
 
```

*** 环境安装(master上操作) ***

```
$ sudo yum install epel-release
$ sudo yum repolist
$ sudo yum update
$ sudo yum install -y NetworkManager
$ sudo yum install -y "@Development Tools" python2-pip openssl-devel python-devel
$ sudo yum install ansible
$ vi /etc/ansible/hosts
[OSEv3:children]
masters
nodes

[OSEv3:vars]
ansible_ssh_user=root
ansible_become=true
openshift_master_cluster_public_hostname=192.168.0.128

openshift_master_default_subdomain=openshift.kalix.com

deployment_type=origin
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/master/htpasswd'}]

openshift_disable_check=disk_availability,docker_image_availability,docker_storage,memory_availability

##监控
openshift_hosted_metrics_deploy=true
openshift_hosted_metrics_public_url=https://hawkular-metrics.example.com/hawkular/metrics

##日志收集
openshift_hosted_logging_deploy=true
openshift_master_logging_public_url=https://kibana.example.com

[masters]
master openshift_hostname=master.kalix.com openshift_ip=192.168.0.128

[etcd]
master openshift_hostname=master.kalix.com openshift_ip=192.168.0.128

[nodes]
master openshift_node_labels="{'region': 'infra', 'zone': 'default'}" openshift_hostname=master.kalix.com  openshift_ip=192.168.0.128
node1 openshift_node_labels="{'region': 'primary', 'zone': 'east'}" openshift_hostname=node1.kalix.com  openshift_ip=192.168.0.138
node2 openshift_node_labels="{'region': 'primary', 'zone': 'west'}" openshift_hostname=node2.kalix.com  openshift_ip=192.168.0.148
```
openshift_master_cluster_public_hostname 修改为master的公网IP

openshift_master_default_subdomain 换成自己的域名

所有openshift_ip 修改为对应节点的局域网IP

ansible_ssh_user 为当前linux操作用户名

openshift_hosted_metrics_public_url 监控访问地址

openshift_master_logging_public_url 日志访问地址

*** 安装 ***

```
注意：最新脚本请移步https://github.com/openshift/openshift-ansible/releases查看
$ sudo wget  https://github.com/openshift/openshift-ansible/archive/openshift-ansible-3.10.0-0.16.0.tar.gz
$ sudo tar -xvf openshift-ansible-3.6.24-1.tar.gz
$ cd openshift-ansible-openshift-ansible-3.6.24-1
$ ansible-playbook playbooks/byo/config.yml
```

*** 配置 ***

```
$ sudo htpasswd /etc/origin/master/htpasswd admin
$ sudo oadm manage-node master --schedulable=true
$ sudo oadm policy add-cluster-role-to-user cluster-admin admin
//设置docker代理（下载docker快点）（每个节点都要执行,执行完后重启docker）
$ sudo curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://212aa84b.m.daocloud.io

```
打开 openshift  

https://ip:8443


//将docker和origin数据写入挂载盘

sudo vi /etc/fstab
/mnt/data/docker /var/lib/docker none bind 0 0

### 升级 ansible
sudo yum install -y "@Development Tools" python2-pip openssl-devel python-devel

pip install ansible=xxxx

xxx是对应的版本
### No package matching 'origin-docker-excluder-3.10**' found available, installed or updated

cd /etc/yum.repos.d && curl -O https://storage.googleapis.com/origin-ci-test/releases/openshift/origin/master/origin.repo

## faq

oadm policy add-scc-to-user anyuid -z default


