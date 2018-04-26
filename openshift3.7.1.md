# openshift 3.7.1 安装笔记
## add authority

oc adm policy add-scc-to-user anyuid -z default

## openshift install 3.7.1

https://github.com/gshipley/installcentos

## install openshift image stream template

```batch

oc delete is --all

curl https://raw.githubusercontent.com/openshift/origin/v3.9.0/examples/image-streams/image-streams-centos7.json \
|oc create -f - -n openshift

```

## jenkins pipeline example

```batch
 oc new-app https://github.com/minikiller/mapit-spring.git --strategy=pipeline
```

## 系统诊断

 oadm diagnostics
 
 ## 服务命名规则
 
 docker-registry.default.svc.cluster.local
 [servicename]-[namespace].router.default.svc.cluster.local
 
 ## 测试registry
 172.30.254.72 是docker-registry的service的ip
 ```batch
[root@node1 ~]# docker login -u admin -p $(oc whoami -t) 172.30.254.72:5000
Login Succeeded
[root@node1 ~]# docker pull docker.io/busybox
Using default tag: latest
Trying to pull repository docker.io/library/busybox ...
latest: Pulling from docker.io/library/busybox
f70adabe43c0: Pull complete
Digest: sha256:186694df7e479d2b8bf075d9e1b1d7a884c6de60470006d572350573bfa6dcd2
Status: Downloaded newer image for docker.io/busybox:latest
[root@node1 ~]# docker tag docker.io/busybox 172.30.254.72:5000/openshift/busybox
[root@node1 ~]# docker push 172.30.254.72:5000/openshift/busybox
The push refers to a repository [172.30.254.72:5000/openshift/busybox]
0314be9edf00: Pushed
latest: digest: sha256:186694df7e479d2b8bf075d9e1b1d7a884c6de60470006d572350573bfa6dcd2 size: 527
[root@node1 ~]# ls /etc/docker/certs.d/
```

### 测试 redhat registry 

```batch
docker pull registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift
docker login -u minikiller@qq.com -p hanling registry.access.redhat.com
# 错误现象
Error response from daemon: open /etc/docker/certs.d/registry.access.redhat.com/redhat-ca.crt: 
no such file or directory
#解决办法
yum install -y *rhsm*
```

## openjdk image stream 注册
```batch

https://github.com/jboss-openshift/application-templates/blob/master/openjdk/openjdk18-image-stream.json

oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/openjdk/openjdk18-image-stream.json

```

## 重要资源例子
```batch
https://blog.openshift.com/part-1-from-app-to-openshift-runtimes-and-templates/
https://blog.openshift.com/building-declarative-pipelines-openshift-dsl-plugin/
https://github.com/siamaksade/coolstore-microservice
https://github.com/OpenShiftDemos/nexus-openshift-docker
https://github.com/OpenShiftDemos/openshift-cd-demo
https://ipaas.com.cn/blog/post/seanzhau/3ada17a7b2b8 
https://blog.openshift.com/openshift-pipelines-jenkins-blue-ocean/
```

## 导出模板 
 oc export all -o yaml --as-template=kong-template > ./kong-template.yaml

## fabric8
``` 
Please make sure your github OAuth Application Client ID: 07432c6a00821cf3dfda points to the
Authorization callback URL: http://keycloak-fabric.apps.bogon.com/auth/realms/fabric8/broker/github/endpoint



Please can you invoke the following commands as a cluster admin

oc create --as system:admin -f oauthclient.yaml
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:fabric:init-tenant
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:fabric:exposecontroller
```

## jenkins
```bash
[root@bogon project]# oc set env bc/kalix-parent MAVEN_MIRROR_URL=http://nexus/nexus/content/groups/public/
buildconfig "kalix-parent" updated
[root@bogon project]# oc set env bc/kalix-parent --list
# buildconfigs kalix-parent
MAVEN_MIRROR_URL=http://nexus/nexus/content/groups/public/
```