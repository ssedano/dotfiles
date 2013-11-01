# custom exports
export PAGER="less -rFnXME"
export JAVA_HOME=/opt/jdk
export M2_HOME=/opt/maven
export CATALINA_HOME=/opt/tomcat
export CATALINA_BASE=/opt/tomcat

export PATH=$PATH:$M2_HOME/bin:$HOME/.rvm/bin:$HOME/opt/clojure-contrib/launchers/bash
export JYTHONPATH=/home/ssedano/projects/kahuna

export M2_REPO=~/.m2/repository
export JARS_HOME=~/jars
export CLOJURE_EXT=~/.clojure

export MAVEN_OPTS="-Xms140m -XX:PermSize=140m -XX:MaxPermSize=441m -Xmx1024m -XX:+UseNUMA -XX:+UseCompressedOops"
export JAVA_DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8084"
export JAVA_DEBUG_SUSPEND="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8084"

export DRIP_SHUTDOWN=30
