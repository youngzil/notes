#JDK下载：http://www.oracle.com/technetwork/java/javase/archive-139210.html
#指定默认版本: java -version
export JAVA_HOME=`/usr/libexec/java_home`    
export JAVA_HOME=$(/usr/libexec/java_home)    
#指定自定义版本,两种方式都可以
#export JAVA_HOME=`/usr/libexec/java_home -d 64 -v 1.6`    
#export JAVA_HOME=$(/usr/libexec/java_home -d 64 -v 1.6)
#export JAVA_HOME=`/usr/libexec/java_home -d 64 -v 1.7`    
#export JAVA_HOME=$(/usr/libexec/java_home -d 64 -v 1.7)
export JAVA_HOME=`/usr/libexec/java_home -d 64 -v 1.8`
export JAVA_HOME=$(/usr/libexec/java_home -d 64 -v 1.8)
#export JAVA_HOME=`/usr/libexec/java_home -d 64 -v 9`    
#export JAVA_HOME=$(/usr/libexec/java_home -d 64 -v 9)
#export JAVA_HOME=`/usr/libexec/java_home -d 64 -v 10`    
#export JAVA_HOME=$(/usr/libexec/java_home -d 64 -v 10)

#下面方式不生效，不知道为什么
#export JAVA_HOME=﻿﻿﻿﻿/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#export JAVA_HOME=﻿﻿﻿﻿/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
#export JAVA_HOME=﻿﻿﻿﻿/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
#export JAVA_HOME=﻿﻿﻿﻿/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home
#export PATH=$JAVA_HOME/bin:$PATH
#export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#export PATH=.:$PATH:$JAVA_HOME/bin
#export CLASSPATH=.:$JAVA_HOME/lib











