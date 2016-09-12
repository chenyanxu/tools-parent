# install openshift
install openshift
## run example
$ oc new-app openshift/nodejs-010-centos7~https://github.com/openshift/nodejs-ex.git
# install databse
## install couchdb
## install postgresql
## install redis
# install fabric8
install fabric8
# install cd-pipeline
install jenkins
# install karaf
## ssh to karaf
    [root@master ~]# oc get svc
    NAME           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
    tools-parent   172.30.161.85   <none>        8101/TCP,8181/TCP,8778/TCP   8h
    ssh login to karaf container:
    [root@master ~]# ssh karaf@172.30.161.85 -p 8101
    Password authentication
    Password:
    
       __           .__  .__
     |  | _______  |  | |__|__  ___
     |  |/ /\__  \ |  | |  \  \/  /
     |    <  / __ \|  |_|  |>    <
     |__|_ \(____  /____/__/__/\_ \
          \/     \/              \/
    
     OSGI Framework for Development - (version 1.0.0-SNAPSHOT)
    
     Using: http://www.kalix.com
    
    
    Hit '<tab>' for a list of available commands
    and '[cmd] --help' for help on a specific command.
    Hit '<ctrl-d>' or 'osgi:shutdown' to shutdown

