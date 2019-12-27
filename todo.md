### 虚拟机管理  文档记录
 ### devops
 #### 一台高配单机devops
 #### cluster devops
 
### 监控 
https://www.ibm.com/developerworks/cn/cloud/library/cl-lo-prometheus-getting-started-and-practice/
https://daenney.github.io/2018/04/21/setting-up-alertmanager


https://work.weixin.qq.com/wework_admin/register_wx?from=sem_baidu&keyword=brand&derivative=0010505600

 /usr/bin/alertmanager --config.file=/etc/prometheus/alertmanager.yml --log.level=debug
 
 
 
 docker run -d   -p 9090:9090   --name prometheus -v /etc/localtime:/etc/localtime:ro  -v /opt/prometheus/etc/prometheus.yml:/etc/prometheus/prometheus.yml  -v /etc/prometheus/alert.rules:/etc/prometheus/alert.rules  -v /tmp/prometheus-data:/prometheus-data   quay.io/prometheus/prometheus
 
 
 ipmitool -H 171.99.0.5 -I lanplus -U root -P root power status
 
### todo next
* search druid 
* guava  
* zookeeper

* https://jenkins.io/doc/book/pipeline/
* https://developers.redhat.com/blog/2018/08/29/intro-to-podman/

 