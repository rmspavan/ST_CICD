CICD-Project: DevOps Project - Jenkins CI - CD for Kubernetes Deployments
---------------------------------------------------------------------------

* Git
* GitLab/GitHub
* SonarQube
* Jgrog Artifactory
* Jenkins
* Ansible
* Docker & Docker private repository
* Kubernetes

A. Push the source code to Github/GitLab repository

B. Configure SonarQube: (2core and 2gb ram, ports: 22, 5432, 9000, 80 , JDK 11)
        a. Install & Configure PSQL
        b. Install & Configure SonarQube scanner
    

--> Install Java
--------------------
1. yum install java-1.8* -y

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
     CRREATE USER sonar WITH PASSWORD 'sonar';
     ALTER USER sonar WITH SUPERUSER
     \du
     CREATE DATABASE sonar;
     \l
     GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;
     \q and exit postgres user

10. Edit the pg_hba.conf
    vi /var/lib/pgsql/data/pg_hba.conf
    * change METHOD from peer/ident to trust 


--> Integrating SonarQube with Jenkins
---------------------------------------
  * Download sonar scanner onto Jenkins
  * Update sonar scanner properties
  * Install sonar scanner plugun
  * Configure sonar scanner and sonar server
  * Execute job


    
        