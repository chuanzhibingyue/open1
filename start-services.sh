HOME=`pwd`

cd $HOME/env-pay/

java -jar pay-service-user.jar &
java -jar pay-service-account.jar &
java -jar pay-service-bank.jar &
java -jar pay-service-banklink.jar &
java -jar pay-service-trade.jar &
java -jar pay-service-payrule.jar &
java -jar pay-service-cost.jar &
java -jar pay-service-fee.jar &
java -jar pay-service-limit.jar &
java -jar pay-service-notify.jar &
java -jar pay-service-remit.jar &
java -jar pay-service-report.jar &
java -jar pay-service-settlement.jar &
