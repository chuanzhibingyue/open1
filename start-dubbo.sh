#!/bin/bash

echo start simple registry
HOME=`pwd`
cd $HOME/env-dubbo/dubbo-registry-simple/
./bin/restart.sh
echo done

echo start simple monitor
cd $HOME/env-dubbo/dubbo-monitor-simple/
./bin/restart.sh
echo done.  http://127.0.0.1:8080/

