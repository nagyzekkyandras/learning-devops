FROM java:8
 
# download mysql connector and confluence
RUN wget --no-check-certificate http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz
RUN wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.15.2.tar.gz
 
# unzip downloaded files
RUN tar -xzf atlassian-confluence-6.15.2.tar.gz 
RUN tar -xzf mysql-connector-java-5.1.47.tar.gz
 
# mysql connector mv
RUN mv mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar /usr/lib
 
# delete unused files
RUN rm mysql-connector-java-5.1.47.tar.gz
RUN rm -rf mysql-connector-java-8.0.17
 
# create confluence dir
RUN mkdir -p /var/data/confluence
RUN mkdir -p /var/data/confluence-home
 
# copy confluence files to /var/data
RUN cp -R atlassian-confluence-6.15.2/* /var/data/confluence-home
 
# delete unused files
RUN rm atlassian-confluence-6.15.2.tar.gz 
RUN rm -r atlassian-confluence-6.15.2
 
# setting up confluence dir
COPY server.xml /var/data/confluence-home/conf/server.xml
 
# mysql connector to confluence
RUN cp -f /usr/lib/mysql-connector-java-*.jar /var/data/confluence-home/confluence/WEB-INF/lib/
 
# confluence home dir setting
RUN echo "confluence.home=/var/data/confluence-home/" > /var/data/confluence-home/confluence/WEB-INF/classes/confluence-init.properties
 
# JVM MAX RAM usage
RUN sed -i s/1024m/2048m/g /var/data/confluence-home/bin/setenv.sh
 
# permisions added
RUN chmod -R 777 /var/data/*
 
# open port what configured in server.xml
EXPOSE 8080
 
# permission mask
RUN umask 0000
 
# RUN as not root user
USER 1001
 
# start the launch script
ENTRYPOINT ["/var/data/confluence-home/bin/start-confluence.sh", "-fg"]