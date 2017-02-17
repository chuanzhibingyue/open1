#!/bin/bash

echo start simple registry
HOME=`pwd`
cd $HOME/env-dubbo/dubbo-registry-simple/
./bin/start.sh
echo done

echo start simple monitor
cd $HOME/env-dubbo/dubbo-monitor-simple/
./bin/start.sh
echo done.  http://127.0.0.1:8080/

