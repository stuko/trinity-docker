# 0 */2 * * * cd /home/java/trinity/trinity-en/ && ./backup.sh
# 0 */2 * * * cd /home/java/trinity/wayd-install/ && ./backup.sh

postfix=`date '+%Y%m%d%H%M%S'`
jar -cvf ../backup/trinity-${postfix}.jar ./*
