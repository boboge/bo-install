#!/usr/bin/env bash
DIR=`dirname $0`

source $DIR/env.sh



if [ -z "$TOMCAT_HOME" ] ; then
    echo "Please set TOMCAT_HOME22"
    exit
fi

if [ ! -e ../../conf/webapps ] ; then
    mkdir -p ../../conf/webapps
fi

if [ ! -e ../../logs ] ; then
    mkdir -p ../../logs
fi


rm -rf $TOMCAT_HOME/webapps

cp -r $NODE_PATH/war/* $NODE_PATH/conf/webapps/

ln  -s $NODE_PATH/conf/webapps $TOMCAT_HOME/webapps

param1="$1"

if [ "$param1" = "restart" ] ; then

echo "tomcat $TOMCAT_HOME/bin/catalina.sh"

$TOMCAT_HOME/bin/catalina.sh stop

ps -ef |grep tomcat |grep $TOMCAT_HOME/conf/logging.properties |grep -v 'grep'|awk '{print $2}' | xargs kill -9

$TOMCAT_HOME/bin/catalina.sh start


fi


