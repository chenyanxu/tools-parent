package com.kalix.tools.hadoop.api;

public interface HdfsConfigService {

    static final String HDFS_LOCATION = "/karaf/cookbook/etc";

    void storeConfigs();

    void readConfigs();
}
