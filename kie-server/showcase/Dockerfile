#################################################################################
# Dockerfile that provides the image for JBoss KIE Server 7.17.0.Final Showcase
#################################################################################

####### BASE ############
FROM jboss/kie-server:7.17.0.Final

####### ENVIRONMENT ############
# ENV KIE_SERVER_ID kie-server
ENV KIE_SERVER_LOCATION http://localhost:8080/kie-server/services/rest/server
ENV KIE_SERVER_USER kieserver
ENV KIE_SERVER_PWD kieserver1!
# When using this image against jboss/jbpm-workbench-showcase use /jbpm-console/rest/controller
# ENV KIE_SERVER_CONTROLLER http://localhost:8080/kie-wb/rest/controller
ENV KIE_SERVER_CONTROLLER_USER admin
ENV KIE_SERVER_CONTROLLER_PWD admin
ENV KIE_MAVEN_REPO http://localhost:8080/kie-wb/maven2
ENV KIE_MAVEN_REPO_USER admin
ENV KIE_MAVEN_REPO_PASSWORD admin
ENV JAVA_OPTS -Xms256m -Xmx1024m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8
ENV M2_HOME $JBOSS_HOME/../.m2

####### Drools KIE Server CUSTOM CONFIGURATION ############
RUN mkdir -p $HOME/.m2/repository/org/ipodrools/kieserver/hello-kie-server/1.0
ADD etc/standalone-full-kie-server.xml $JBOSS_HOME/standalone/configuration/standalone-full-kie-server.xml
ADD etc/kie-server-users.properties $JBOSS_HOME/standalone/configuration/kie-server-users.properties
ADD etc/kie-server-roles.properties $JBOSS_HOME/standalone/configuration/kie-server-roles.properties
ADD etc/start_kie-server.sh $JBOSS_HOME/bin/start_kie-server.sh
ADD etc/setup_kie-server.sh $JBOSS_HOME/bin/setup_kie-server.sh
ADD etc/create_container.sh $JBOSS_HOME/bin/create_container.sh
ADD etc/curl_kie-server.sh $JBOSS_HOME/bin/curl_kie-server.sh
ADD etc/createHelloContainer.xml $JBOSS_HOME/bin/createHelloContainer.xml
ADD etc/settings.xml $JBOSS_HOME/../.m2/settings.xml
ADD etc/hello-kie-server-1.0.jar $JBOSS_HOME/../.m2/repository/org/ipodrools/kieserver/hello-kie-server/1.0/hello-kie-server-1.0.jar
ADD etc/hello-kie-server-1.0.pom $JBOSS_HOME/../.m2/repository/org/ipodrools/kieserver/hello-kie-server/1.0/hello-kie-server-1.0.pom

# Added files are chowned to root user, change it to the jboss one.
USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/standalone-full-kie-server.xml && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/kie-server-users.properties && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/kie-server-roles.properties && \
chown jboss:jboss $JBOSS_HOME/bin/start_kie-server.sh && \
chown jboss:jboss $JBOSS_HOME/bin/setup_kie-server.sh && \
chown jboss:jboss $JBOSS_HOME/bin/create_container.sh && \
chown jboss:jboss $JBOSS_HOME/bin/curl_kie-server.sh && \
chown jboss:jboss $JBOSS_HOME/bin/createHelloContainer.xml && \
chown jboss:jboss $JBOSS_HOME/../.m2/settings.xml

####### JBOSS USER ############
# Switchback to jboss user
USER jboss

####### RUNNING KIE-SERVER ############
WORKDIR $JBOSS_HOME/bin/
#CMD ["./setup_kie-server.sh"]
RUN ./setup_kie-server.sh
#RUN ./create_container.sh
CMD ["./start_kie-server.sh"]
#CMD ["./setup_kie-server.sh"]

