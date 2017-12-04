# bo-install
一个Linux环境下部署web应用的快速搭建脚本支持jetty、tomcat


![](http://7xt9nt.com1.z0.glb.clouddn.com/5a22ba13e4b0dce08034c495?e=1512228900&token=trhI0BY8QfVrIGn9nENop6JAc6l5nZuxhjQ62UfM:uATC-Ix_TcbsjGXkyhRce6o5xrk=)

使用方法比较简单 sh init.sh 项目名称 端口号 tomcat端口列表（选填）,会在上级目录生产一个项目，最后sh jettyrestart.sh 或者 sh tomcatrestart.sh即可

### bo-install 是什么
* 它是一个Linux下快速搭建 java web容器的 shell脚本集合
* 它使用非常简单只需要 一句shell命令 sh init.sh 项目名称 端口号
* 它使单台Linux部署多个tomcat、多个jetty实例变的非常简单
* 它切换tomcat、jetty版本非常简单只需在最外层的jetty目录或者tomcat目录放置你想要的版本即可


