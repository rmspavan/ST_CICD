1. Installation Steps
   Login to instance as a root user and install Java

     yum install java-1.8* -y 

2. Download Artifactory packages onto /opt/
    For Latest version of Artifactory OSS download it from here
    For Older version of Artifactory OSS download it from here
    For Latest version of Artifactory Pro download it from here

    cd /opt 
    wget https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip or 
    https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/[RELEASE]/jfrog-artifactory-oss-[RELEASE]-linux.tar.gz

3. extract artifactory tar.gz file

    unzip jfrog-artifactory-oss-6.9.6.zip

4. Go inside to bin directory and start the services

    cd /opt/jfrog-artifactory-oss-6.9.6/bin
    ./artifactory.sh start

5. access artifactory from browser

    http://<PUBLIC_IP_Address>:8081 

6. Provide credentials

    username: admin
    password: passwrod 



Integrate Artifactory with Jenkins:
------------------------------------------

1. Login to Jenkins to integrate Artifactory with Jenkins

    Install "Artifactory" plug-in
    Manage Jenkins -> Jenkins Plugins -> available -> artifactory

2. Configure Artifactory server credentials

    Manage Jenkins -> Configure System -> Artifactory
        Artifactory Servers
            Server ID : Artifactory-Server
            URL : Artifactory Server URL
            Username : admin
            Password : `admin@123

3. to test--->

    Create a Maven Project
    3.1 Create a new job
            Job Name : artifactory-project
    3.2 Source code management
            Git URL : get URL here
    3.3 Build Environment
            Resolve artifacts from Artifactory : <provide Artifactory server and repository details>
    3.4 Build - Goals: clean install
    3.5 Post-build Actions
            Deploy Artifacts to Artifactory : <provide Artifactory server and repository details>
    3.6 Execute job