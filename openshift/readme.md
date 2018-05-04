## create project
```batch
oc new-project kalix
```

## nexus2
```
# install nexus2
oc new-app sonatype/nexus
oc expose svc/nexus
# install nexus3
# oc new-app sonatype/nexus3
```
> 访问路径 [发布地址]/nexus
## add volume of nexus
```batch
oc volume dc/nexus --add --name=nexus-storage -t pvc \
     --claim-name=nexus-claim --overwrite
```
## kong-template.yaml
kong
## pipeline.yaml
pipeline for kalix project

## add volume to jenkins-maven-slave

> ref to https://blog.openshift.com/decrease-maven-build-times-openshift-pipelines-using-persistent-volume-claim/

## kalix-release

   oc new-app --strategy=source openshift/kalix-s2i~https://github.com/chenyanxu/tools-parent.git --context-dir=tools-karaf-assembly -e 'MAVEN_ARGS=mvn clean install karaf:assembly karaf:archive' --name=karaf-release
   