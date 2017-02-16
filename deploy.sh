#!/bin/bash
echo copying jar lib into directory env_pay
mkdir -p ./env-pay/lib
cp dubbo/pay-service-*/target/*.jar env-pay/
cp -R dubbo/pay-service-*/target/lib/ env-pay/lib
echo done

echo copying war into directory webapps
mkdir -p ./webapps/
cp -R dubbo/pay-web-*/target/*.war ./webapps/
done
