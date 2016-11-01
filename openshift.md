# install openshift

- [run examle](#run-example)
- [install databse](#install-databse)  
    - [install couchdb](#install-couchdb)
    - [install postgresql](#install-postgresql)
    - [install redis](#install-redis)  
- [install fabric](#install-fabric)       
- [install karaf](#install-karaf) 
    - [ssh to karaf](#ssh-to-karaf) 

# run example

```bash
$ oc new-app openshift/nodejs-010-centos7~https://github.com/openshift/nodejs-ex.git
```

# install database

```bash
 oc new-project database
 oadm policy add-scc-to-user fabric8-develop -z default
```

## install couchdb
## install postgresql
```bash
  docker tag sameersbn/postgresql 172.30.14.164:5000/openshift/postgresql
  oc new-app openshift/postgresql -e 'PG_PASSWORD=1234' -e 'DB_NAME=kalix' -e 'REPLICATION_USER=repluser' -e 'REPLICATION_PASS=repluserpass'
  oc create -f https://github.com/chenyanxu/karaf-s2i/blob/master/postgresql/postgresql-pvc.yaml
  oc volumes dc/postgresql --add --claim-name=postgresql --mount-path=/var/lib/postgresql \ -t persistentVolumeClaim --overwrite
```
  成功界面
```bash
    Initializing datadir...
    Initializing certdir...
    Initializing logdir...
    Initializing rundir...
    Setting resolv.conf ACLs...
    Initializing database...
    Configuring hot standby...
    ‣ Setting postgresql.conf parameter: wal_level = 'hot_standby'
    ‣ Setting postgresql.conf parameter: max_wal_senders = '16'
    ‣ Setting postgresql.conf parameter: checkpoint_segments = '8'
    ‣ Setting postgresql.conf parameter: wal_keep_segments = '32'
    ‣ Setting postgresql.conf parameter: hot_standby = 'on'
    ‣ Setting postgresql.conf parameter: data_directory = '/var/lib/postgresql/9.5/main'
    ‣ Setting postgresql.conf parameter: log_directory = '/var/log/postgresql'
    ‣ Setting postgresql.conf parameter: log_filename = 'postgresql-9.5-main.log'
    ‣ Setting postgresql.conf parameter: ssl = 'off'
    Creating database: kalix...
    Starting PostgreSQL 9.5...
    LOG:  database system was shut down at 2016-09-20 06:08:40 UTC
    LOG:  MultiXact member wraparound protections are now enabled
    LOG:  autovacuum launcher started
    LOG:  database system is ready to accept connections
```

* postgresql cluster  

    ```bash  
    oc new-app openshift/postgresql-db --name postgresql-slave01 \
          -e 'REPLICATION_MODE=slave' -e 'REPLICATION_SSLMODE=prefer' \
      -e 'REPLICATION_HOST=postgresql-db.database.svc.cluster.local' -e 'REPLICATION_PORT=5432'  \
      -e 'REPLICATION_USER=repluser' -e 'REPLICATION_PASS=repluserpass' 
    ```

## install redis

## install oracle

oc new-app sath89/oracle-xe-11g --name=oracle

refer https://github.com/MaksymBilenko/docker-oracle-xe-11g

# install fabric8
install fabric8
> **Note**: Builds are also available on [Quay.io](https://quay.io/repository/sameersbn/postgresql)  

## install cd-pipeline

install jenkins

### example of jenkins

  https://github.com/openshift/origin/tree/master/examples/jenkins/pipeline
  https://github.com/OpenShiftDemos/openshift-cd-demo

### note

  https://github.com/openshift/origin/issues/11170
  https://docs.openshift.org/latest/install_config/configuring_pipeline_execution.html

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

# install apiman

## install apiman to openshift

```bash
docker pull apiman/on-wildfly10
docker login -u admin -p ch37M-66BC2HDdUs7EAJES8k2gQGAz-fuLFvZa-nB8w -e add@sn.com 172.30.97.105:5000
docker tag apiman/on-wildfly10 172.30.97.105:5000/openshift/apiman
docker push 172.30.97.105:5000/openshift/apiman
oc new-app openshift/apiman
```

[kong](https://hub.docker.com/r/littlebaydigital/kong/)

# install karaf release

```bash
    oc new-app --strategy=source openshift/s2i-karaf~https://github.com/chenyanxu/tools-parent.git --context-dir=tools-karaf-assembly -e 'MAVEN_ARGS=mvn clean install karaf:assembly karaf:archive' --name=karaf-release
```

> **Note**: 
  > **create router http://apiman.kalix.vagrant.f8/**
  > access http://apiman.kalix.vagrant.f8/apimanui and input user:admin password:admin123!
  > access http://apiman.kalix.vagrant.f8/auth/admin to access 
  
# backup and restore of postgresql

```bash

Backup your databases

docker exec -t your-db-container pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

Restore your databases

cat your_dump.sql | docker exec -i your-db-container psql -U postgres

```
