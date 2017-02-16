#!/bin/bash
echo copying jar lib into directory env_pay
mkdir -p ./env-pay/lib
cp dubbo/pay-service-*/target/*.jar env-pay/
cp -R dubbo/pay-service-*/target/lib/ env-pay/lib
cp env-pay/lib/pay-common-config.jar env-pay/lib/pay-common-config-main-1.0-SNAPSHOT.jar
echo done

echo copying war into directory webapps
mkdir -p ./webapps/
cp -R dubbo/pay-web-*/target/*.war ./webapps/
echo done
