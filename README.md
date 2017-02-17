Open Source Project 

== Ignore binary and logs for git == 

   vi .git/info/exclude
 
   **/target/*
 
   **/logs/*
   
== Install DB ==

./mysql -uroot -pwusc.321

create database edu_simple_pay;

delimiter //

source edu_simple_pay.sql

source /Users/vincent/workspace/edu_func.sql

delimiter ;

== Installation and build ==

1. install dependent jars:

  cd dependent

  ./install.sh

2. build project source code:
  ./build.sh

3. collect jars into env-pay to run: 
   ./deploy.sh

4. run dubbo registry and monitor:
   ./run_dubbo.sh

5. run services :
   ./run_services.sh

6. run tomcat and webapps

   copy webapps/*.war to tomcat

  ./bin/catalina run
  
7. stop env

  ./stop_services

  ./stop_dubbo

