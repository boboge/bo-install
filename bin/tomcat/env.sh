#!/usr/bin/env bash

if [ -z "$APP_NAME" ] ; then
  export APP_NAME=xxx
  export NODE_PATH=p_home
  export app_conf=$NODE_PATH/conf
fi

TOMCAT_LOG=$NODE_PATH/logs/catalina.out

JAVA_MEM_OPTS=" -server -XX:+UseParNewGC -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:-CMSParallelRemarkEnabled -XX:CMSInitiatingOccupancyFraction=70 -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:-HeapDumpOnOutOfMemoryError "

JAVA_OPTS_EXT=" -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dapplication.codeset=UTF-8 -Dfile.encoding=UTF-8  "

JAVA_DEBUG=" -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8088 "

export JAVA_OPTIONS="$JAVA_MEM_OPTS $JAVA_OPTS_EXT "

if [ -z "$TOMCAT_HOME" ] ; then
    echo "Please set TOMCAT_HOME1"
    exit
fi
export CATALINA_OUT="$TOMCAT_LOG"
export CATALINA_HOME="$TOMCAT_HOME"
