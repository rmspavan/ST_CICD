C. Configure SonarQube: (2core and 2gb ram, ports: 22, 5432, 9000, 80 , JDK 11)
        a. Install & Configure PSQL
        b. Install & Configure SonarQube scanner
    

--> Install Java
--------------------
1. yum install java-1.8* -y or install openjdk-11-jdk -y

--> Install PostgreSql
-------------------------

1. dnf module list postgresql
2. sudo dnf module enable postgresql:11 or 13 
3. sudo dnf install postgresql-server or yum install postgresql-server postgresql-devel postgresql -y
4. sudo postgresql-setup --initdb or /usr/bin/postgresql-setup --initdb
5. sudo systemctl start postgresql
6. sudo systemctl enable postgresql
7. check the postgres user is created or not? # tail -1 /etc/passwd
8. su - postgres
9. psql
    --   CRREATE USER sonar WITH PASSWORD 'sonar';
    --   ALTER USER sonar WITH SUPERUSER
    --   \du
    --   CREATE DATABASE sonar;
    --   \l
    --   GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;
    --   \q and exit postgres user

10. Edit the pg_hba.conf
    vi /var/lib/pgsql/data/pg_hba.conf
    * change METHOD from peer/ident to trust 

11. yum install net-tools -y
    Added below entries in /etc/sysctl.conf
        vm.max_map_count=524288
        fs.file-max=131072
        ulimit -n 131072
        ulimit -u 8192

    Add below entries in /etc/security/limits.conf
        sonarqube   -   nofile   131072
        sonarqube   -   nproc    8192
    reboot the server
        init 6


--> SonarQube Setup:
-----------------------
1. Download soarnqube and extract it.

        wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.2.46101.zip
        unzip sonarqube-8.9.2.46101.zip
        mv sonarqube-8.9.2.46101.zip sonarqube
        cd sonarqube

2. Update sonar.properties with below information

        vi sonar.properties
        sonar.jdbc.username=sonar
        sonar.jdbc.password=sonar
        
        #--postgress---
        sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
        
        #----JVMOptions-----
        sonar.search.javaOpts=-Xmx512m -Xms512m -XX:MaxDirectMemorySize=256m -XX:+HeapDumpOnOutOfMemoryError

3. 1. Create a `/etc/systemd/system/sonarqube.service` file start sonarqube service at the boot time ```sh

cat >> /etc/systemd/system/sonarqube.service <<EOL
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
User=sonar
Group=sonar
PermissionsStartOnly=true
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start 
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
StandardOutput=syslog
LimitNOFILE=65536
LimitNPROC=4096
TimeoutStartSec=5
Restart=always

[Install]
WantedBy=multi-user.target
EOL

4. Add sonar user and grant ownership to /opt/sonarqube directory
        useradd -d /opt/sonarqube sonar
        chown -R sonar:sonar /opt/sonarqube

5. Reload the demon and start sonarqube service
        systemctl daemon-reload 
        systemctl start sonarqube.service 

6. open browser and access the sonarqube
        http://localhost:9000 
        login with admin/admin and cnage password
        

--> Integrating SonarQube with Jenkins
---------------------------------------
  * Download sonar scanner onto Jenkins
  * Update sonar scanner properties
  * Install sonar scanner plugun
  * Configure sonar scanner and sonar server
  * Execute job

1. On Sonarqube server
        Generate a sonarqube token to authenticate from Jenkins

2. On Jenkins server
        Install Sonarqube plugin
        Configure Sonarqube credentials
        Add Sonarqube to jenkins "configure system"
        Install SonarScanner
        Run Pipeline job


    
        