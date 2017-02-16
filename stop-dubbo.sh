#!/bin/bash
echo kill monitor and registry
kill -9 `ps -ef|grep 'dubbo-monitor-simple'|grep -v grep|awk '{print $2}'`
kill -9 `ps -ef|grep 'dubbo-registry-simple'|grep -v grep|awk '{print $2}'`

echo stop simple registry
HOME=`pwd`
cd $HOME/env-dubbo/dubbo-registry-simple/
./bin/stop.sh
echo done

echo stop simple monitor
cd $HOME/env-dubbo/dubbo-monitor-simple/
./bin/stop.sh
echo done.  

