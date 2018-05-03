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