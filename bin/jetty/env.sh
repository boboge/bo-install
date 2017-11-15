#!/usr/bin/env bash

if [ -z "$APP_NAME" ] ; then
  export APP_NAME=xxx
  cd ../../
  export NODE_PATH=$(pwd)
  export app_conf=$NODE_PATH/conf
  cd -
fi

export JETTY_RUN=$NODE_PATH/bin
export JETTY_PID=$NODE_PATH/.jetty.pid
export JETTY_ARGS=jetty.port=---
export JETTY_LOGS=$NODE_PATH/logs


JAVA_MEM_OPTS=" -server -XX:+UseParNewGC -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:-CMSParallelRemarkEnabled -XX:CMSInitiatingOccupancyFraction=70 -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+UseFastAccessorMethods -XX:+UseCMSInitiatingOccupancyOnly -XX:-HeapDumpOnOutOfMemoryError "

JAVA_OPTS_EXT=" -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dapplication.codeset=UTF-8 -Dfile.encoding=UTF-8  "

JAVA_DEBUG=" -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8088 "


export JAVA_OPTIONS="$JAVA_MEM_OPTS $JAVA_OPTS_EXT "
#export JAVA_OPTIONS="$JAVA_OPTIONS $JAVA_DEBUG "
