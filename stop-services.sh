#!/bin/bash
echo kill services 
kill -9 `ps -ef|grep 'pay-'|grep -v grep|awk '{print $2}'`

echo done.  

