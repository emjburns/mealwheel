#!/bin/bash

set -x

PRJ="$(cd `dirname $0` && pwd)"

# deploy app to tomcat, start tomcat

if [ -z $CATALINA_HOME ]; then
    echo "CATALINA_HOME not set." && exit 1
fi

catalina stop
sleep 5
rm -rf ${CATALINA_HOME}/webapps/mealwheel
cp ${PRJ}/target/mealwheel.war ${CATALINA_HOME}/webapps
catalina start
