#!/bin/bash

set -x

PRJ="$(cd `dirname $0` && pwd)"

# deploy app to tomcat, start tomcat

if [ -z $CATALINA_HOME ]; then
    echo "CATALINA_HOME not set." && exit 1
fi

# run backend at 8181 (port in $CATALINA_HOME/conf/server.xml)
catalina stop
sleep 5
rm -rf ${CATALINA_HOME}/webapps/mealwheel
cp ${PRJ}/target/mealwheel.war ${CATALINA_HOME}/webapps
catalina start

# run and launch front end at 8080
cd src/main/front-end && http-server -o
