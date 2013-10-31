export JAVA_HOME=/opt/jdk
export JYTHON_HOME=/usr/local/Cellar/jython/2.5.2/libexec

export MAVEN_OPTS="-Xms40m -Xmx440m -XX:PermSize=40m -XX:MaxPermSize=141m "
export JAVA_DEBUG="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8084"
export JAVA_DEBUG_SUSPEND="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8084"

export DRIP_SHUTDOWN=30

export M2_REPO=~/.m2/repository
export JARS_HOME=~/jars
export CLOJURE_EXT=~/.clojure

export M2_HOME=/opt/maven
export CATALINA_HOME=/opt/tomcat
export CATALINA_BASE=/opt/tomcat
export PATH=$PATH:~/bin:/Library/PostgreSQL/9.1/bin:/usr/local/mysql/bin:/usr/local/Cellar/rabbitmq/3.1.5/sbin

export JRE_HOME=$JAVA_HOME