#!/bin/sh
PROJECT=$1
PORT=$2
TOMCAT_PORT_LIST=$3

if [ -z "$1" ];then
echo "第1个参数项目名称不能为空：sh init.sh 项目名 端口号 tomcat端口列表（可选）"
exit
fi

if [ -z "$2" ];then
echo "第2个参数端口号不能为空：sh init.sh 项目名 端口号 tomcat端口列表（可选）"
exit
fi

if [ -n "$3" ];then
 if [ "$3" -gt 0 ] 2>/dev/null ;then
    echo "$3 is number."  
 else
    echo '第3个参数tomcat 端口列表index必须为数字：sh init.sh 项目名 端口号 tomcat端口列表（可选）'
 exit
 fi
fi

mkdir -vp ../$PROJECT/{war/,conf/webapps/,logs/}
cp -vr $PWD/bin   ../$PROJECT/bin

cp -vr $PWD/jetty ../$PROJECT/bin/jetty
cp -vr $PWD/tomcat ../$PROJECT/bin/tomcat

cd ../$PROJECT/bin
#修改jetty.sh(jetty)
sed -i '1i\if [ -f $NODE_PATH/bin/env.sh ];then' ./jetty/jetty/bin/jetty.sh
sed -i '2i\  source $NODE_PATH/bin/env.sh' ./jetty/jetty/bin/jetty.sh
sed -i '3i\fi' ./jetty/jetty/bin/jetty.sh
#修改catalina.sh(tomcat)
sed -i '1i\if [ -f $NODE_PATH/bin/env.sh ];then' ./tomcat/tomcat/bin/catalina.sh
sed -i '2i\  source $NODE_PATH/bin/env.sh' ./tomcat/tomcat/bin/catalina.sh
sed -i '3i\fi' ./tomcat/tomcat/bin/catalina.sh

#动态生成环境文件（jetty）
sed -i 's/xxx/'$PROJECT'/g' ./jetty/env.sh
sed -i 's/---/'$PORT'/g' ./jetty/env.sh
sed -i 's#p_home_bin#'$PWD'#g' ./jetty/jettyrestart.sh
#动态生成环境文件（tomcat）
sed -i 's/xxx/'$PROJECT'/g' ./tomcat/env.sh
sed -i 's#p_home_bin#'$PWD'#g' ./tomcat/tomcatrestart.sh
sed -i '/<!-- SingleSignOn valve, share authentication/i\<Context path="" docBase="'$PROJECT'" reloadable="true" />'  ./tomcat/tomcat/conf/server.xml
sed -i 's#8080#'$PORT'#g' ./tomcat/tomcat/conf/server.xml


#tomcat另外端口可以在这里添加
if [ "$3" == '1' ];then
TOMCAT_AJP_PORT=8019
TOMCAT_SHUTDOWN_PORT=8015
fi
if [ "$3" == '2' ];then
TOMCAT_AJP_PORT=8029
TOMCAT_SHUTDOWN_PORT=8025
fi
if [ "$3" == '3' ];then
TOMCAT_AJP_PORT=8039
TOMCAT_SHUTDOWN_PORT=8035
fi
if [ "$3" == '4' ];then
TOMCAT_AJP_PORT=8049
TOMCAT_SHUTDOWN_PORT=8045
fi


sed -i 's#8005#'$TOMCAT_AJP_PORT'#g' ./tomcat/tomcat/conf/server.xml
sed -i 's#8009#'$TOMCAT_SHUTDOWN_PORT'#g' ./tomcat/tomcat/conf/server.xml

