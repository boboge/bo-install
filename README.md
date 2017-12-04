# bo-install
一个Linux环境下部署web应用的快速搭建脚本支持jetty、tomcat


![](http://7xt9nt.com1.z0.glb.clouddn.com/5a22ba13e4b0dce08034c495?e=1512228900&token=trhI0BY8QfVrIGn9nENop6JAc6l5nZuxhjQ62UfM:uATC-Ix_TcbsjGXkyhRce6o5xrk=)

使用方法比较简单 sh init.sh 项目名称 端口号 tomcat端口列表（选填）,会在上级目录生产一个项目，最后sh jettyrestart.sh 或者 sh tomcatrestart.sh即可

### bo-install 是什么
* 它是一个Linux下快速搭建 java web容器的 shell脚本集合
* 它使用非常简单只需要 一句shell命令 sh init.sh 项目名称 端口号
* 它使单台Linux部署多个tomcat、多个jetty实例变的非常简单,
* 它切换tomcat、jetty版本非常简单只需在最外层的jetty目录或者tomcat目录放置你想要的版本即可
* 它只需要sh jettyrestart.sh 或 sh tomcatrestart.sh就能完成项目的重启


### bo-install 详细用法
*1.目录介绍
*├── bin
*│   ├── jetty
*│   │   ├── env.sh //jetty环境变量
*│   │   ├── jettyrestart.sh //jetty启动脚本
*│   │   └── jetty.sh
*│   └── tomcat
*│       ├── env.sh  //tomcat环境变量
*│       ├── tomcatrestart.sh //tomcat启动脚本
*│       └── tomcat.sh
*├── init.sh //构建的主要shell
*├── jetty //存放jetty的目录
*├── README.md
*├── test.war //测试war包
*└── tomcat //存放tomcat的目录

*2.QUICK START （jetty）
* 1.将你需要的版本放入上述jetty目录，注意jetty是根目录
* 2.回到init.sh
* 3.执行 sh init.sh test 8080
* 4.你会在bo-install同级目录获得一个test的文件夹目录结构为
*├── bin
*│   ├── jetty
*│   │   ├── env.sh
*│   │   ├── jetty
*│   │   ├── jettyrestart.sh //重启脚本
*│   │   └── jetty.sh
*│   └── tomcat
*│       ├── env.sh
*│       ├── tomcat
*│       ├── tomcatrestart.sh
*│       └── tomcat.sh
*├── conf
*│   └── webapps
*├── logs
*└── war //将要部署war包放在这里，注意war包名称必须和文件夹名称一样
*5.拷贝bo-install下的test.war到刚刚生成的test目录的war目录下
*6.进入
*├── bin
*│   ├── jetty
*7.执行 sh jettyrestart.sh 
*8.![](http://7xt9nt.com1.z0.glb.clouddn.com/5a254e68e4b0dce0803585fb?e=1512397944&token=trhI0BY8QfVrIGn9nENop6JAc6l5nZuxhjQ62UfM:Q4M91Dn3vJyKnLGdDD6teR0fz9o=) 看到能访问说明成功！

 
 





