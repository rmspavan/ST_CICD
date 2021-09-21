# Create Custom Docker Image
# Pull tomcat latest image from dockerhub 
FROM tomcat:latest

# Maintainer
MAINTAINER "systemizer" 

# copy war file on to container 
COPY ./cicd.war /usr/local/tomcat/webapps