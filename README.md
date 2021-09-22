CICD-Project: DevOps Project - Jenkins CI - CD for Kubernetes Deployments
---------------------------------------------------------------------------


DevOps tools  used :
--------------------
1. Git - Local version control system to track the source code changes locally at the developer system
2. Bit Bucket - Distributed version control system providing code integrity and collaboration between contributors.
3. Jenkins - CI/CD tools to  integrate all the DevOps tools and provide Continuous Integration and Continuous Deployments.
4. Apache Maven - Build automation tool to  build Java source code and generate artifacts.
5. SonarQube - Static code quality analysis tool to analyses code bugs, code smells, vulnerabilities, duplicates etc.
6. Artifactory - Artifact repository management to store artifacts in version control.
7. Ansible - Application automation tool to create custom container images automatically and push to DockerHub.
8. Docker - Docker Engine to create and run  containers.
9. Apache Tomcat - Application server to  run java applications.
10. Kubernetes - Container orchestration tool to manage POD deployments automatically in the cluster environment.


Concepts used to automate application deployments using Jenkins CI/CD:
-----------------------------------------------------------------------
1. Source Code Management
2. Jenkins Pipeline - CI/CD
3. Build Source Code
4. Code Quality Analysis
5. Artifact Management
6. Continuous Delivery
7. Continuous Deployments

A. Push the source code to Github/GitLab repository

B. Install and Configure Maven

C. Configure SonarQube: (2cpu and 2gb ram, ports: 22, 5432, 9000, 80 , JDK 11)
        a. Install & Configure PSQL
        b. Install & Configure SonarQube scanner

d. Configure JfrogArtifactory (1cpu & 1gb, ports:8081, 8082)

e. Install and configure Docker & Ansible
f. Install and setup Kubernetes.
g. Install and configure Jenkins
    
Flow:
-------
                                                        ---(Code Analysis)--> SonarQube
                                                       |
Git ----(commit)----> Github ----(Build)-----> Maven ------(Publish Artifactory)--> Jfrog ---(create container Image)---> Ansible ---(Publish Container Image)--> DockerHub --(Deployto QA)----> K8s ---(Deploy to production)--> K8s(tomcat)