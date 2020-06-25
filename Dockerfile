FROM apereo/cas:v5.3.6
EXPOSE 8080 8443
RUN mkdir -p /etc/cas/services 
RUN mkdir -p /etc/cas/config 
COPY ./all-123.json /etc/cas/services/all-123.json
COPY ./application.properties /etc/cas/config/application.properties
RUN cat /etc/cas/services/all-123.json 
RUN cat /etc/cas/config/application.properties 
#RUN  cp ./pom.xml /cas-overlay/pom.xml
RUN keytool -genkeypair -alias cas -keyalg RSA -keypass changeit -storepass changeit -keystore /etc/cas/thekeystore  -dname "CN=cas.example.org,OU=Example,OU=Org,C=AU" -ext SAN="dns:example.org,dns:localhost,ip:127.0.0.1"
CMD ["/cas-overlay/bin/run-cas.sh"]