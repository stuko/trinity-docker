# 0 */2 * * * cd /home/java/trinity/trinity-en/ && ./backup.sh
# 0 */2 * * * cd /home/java/trinity/wayd-install/ && ./backup.sh
postfix=`date '+%Y%m%d%H%M%S'`
jar -cvf ../backup/trinity-en-${postfix}.jar WEB-INF bt err img jsp sp index.html summernote.jsp
rm -rf ./template-target/*
rm -rf ../tomcat/logs/catalina.20*
rm -rf ../tomcat/logs/host-manager.20*
rm -rf ../tomcat/logs/localhost*
rm -rf ../tomcat/logs/manager*
rm -rf ../tomcat/bin/logs/*
rm -rf ../tomcat/bin/logs/*
