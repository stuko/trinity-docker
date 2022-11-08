# SSL to Tomcat
openssl req -new -newkey rsa:2048 -nodes -keyout openssl-trinity-docker.key -out openssl-trinity-docker.csr
openssl x509 -req -days 365000 -in openssl-trinity-docker.csr -signkey openssl-trinity-docker.key -out openssl-trinity-docker.crt
keytool -import -trustcacerts -alias openssl-trinity-docker -file openssl-trinity-docker.crt -keystore trinity-docker.key

# Other Method
keytool -genkey -keyalg RSA -sigalg SHA1withRSA -alias trinity-docker -keysize 2048 -keystore trinity-docker.key
keytool -certreq -alias trinity-docker -keyalg RSA -sigalg SHA1withRSA -file trinity-docker.csr -keystore trinity-docker.key
keytool -import -trustcacerts -alias trinity-docker -file trinity-docker.crt -keystore trinity-docker.key