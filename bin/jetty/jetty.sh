#!/usr/bin/env bash

DIR=`dirname $0`

source $DIR/env.sh


echo $DIR $JETTY_HOME $JETTY_ARGS

if [ -z "$JETTY_HOME" ] ; then
    echo "Please set JETTY_HOME"
    exit
fi

if [ ! -e ../../conf/webapps ] ; then
    mkdir -p ../../conf/webapps
fi

if [ ! -e ../../logs ] ; then
    mkdir -p ../../logs
fi

if [ ! -e ../../conf/webapps/$APP_NAME.xml ] ; then
    conf=../../conf/webapps/$APP_NAME.xml
    echo '<?xml version="1.0"  encoding="ISO-8859-1"?>' >> $conf
    echo '<!DOCTYPE Configure PUBLIC "-//Jetty//Configure//EN" "http://www.eclipse.org/jetty/configure.dtd">' >> $conf
    echo '<Configure class="org.eclipse.jetty.webapp.WebAppContext">' >> $conf
    echo '  <Set name="contextPath">/</Set>' >> $conf
    echo '  <Set name="war">'"$NODE_PATH/war/$APP_NAME.war</Set>" >> $conf
    echo '  <Set name="extractWAR">true</Set>' >> $conf
    echo '  <Set name="copyWebDir">false</Set>' >> $conf
    echo '  <Set name="defaultsDescriptor"><SystemProperty name="jetty.home" default="."/>/etc/webdefault.xml</Set>'  >> $conf
    echo '</Configure>' >> $conf
fi

rm -rf $JETTY_HOME/webapps

ln  -s $NODE_PATH/conf/webapps $JETTY_HOME/webapps

$JETTY_HOME/bin/jetty.sh $1
