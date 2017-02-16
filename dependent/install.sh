#!/bin/bash
mvn install:install-file -Dfile=./fastdfs_client.jar -DgroupId=org.csource -DartifactId=fastdfs_client -Dversion=1.24 -Dpackaging=jar
mvn install:install-file -Dfile=./kaptcha-2.3.2.jar -DgroupId=google.code -DartifactId=kaptcha -Dversion=2.3.2 -Dpackaging=jar
mvn install:install-file -Dfile=./groboutils-core.jar -DgroupId=fakepath -DartifactId=groboutils-core -Dversion=5 -Dpackaging=jar
mvn install:install-file -Dfile=./pinyin4j-2.5.0.jar -DgroupId=com.pinyin4j -DartifactId=pinyin4j -Dversion=2.5.0 -Dpackaging=jar
