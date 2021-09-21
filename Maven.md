Install Maven on Jenkins
------------------------------

1. Download maven packages https://maven.apache.org/download.cgi onto Jenkins server. In this case I am using /opt/maven as my installation     
   directory - Link : https://maven.apache.org/download.cgi

2. Creating maven directory under /opt
        mkdir /opt/maven
        cd /opt/maven
3. downloading maven version 3.6.0
        wget http://mirrors.fibergrid.in/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.zip
        unzip /opt/maven/apache-maven-3.6.0-bin.zip
        
4. Setup M2_HOME and M2 paths in .bash_profile of user and add these to path variable

        vi ~/.bash_profile
        M2_HOME=/opt/maven/apache-maven-3.6.0
        M2=$M2_HOME/bin
        PAHT=<Existing_PATH>:$M2_HOME:$M2

5. Check point
   logoff and login to check maven version Check maven version

          mvn –version

6. So far you have completed installation of maven software to support maven plugin on jenkins console. Let's jump onto jenkins to complete   remining steps.

7. Setup maven on jenkins console
        7.1 Install maven plugin without restart
                Manage Jenkins > Jenkins Plugins > available > Maven Invoker
        
8. (Update) Install "Maven Integration" Plugin as well
        8.1 Install maven Integration Plugin without restart
               Manage Jenkins > Jenkins Plugins > available > Maven Integration

9. Configure java path
        Manage Jenkins > Global Tool Configuration > Maven