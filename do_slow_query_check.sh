email="test@test.com"
slow_log=/logs/log/MDLI01VMD01-slow.log.1.gz

log_file="/home/mgruen/slow_$(date "+%F")_1.log"
gunzip -c $slow_log | pt-query-digest -umaintenance --since 24h > $log_file

mutt $email -s "$(hostname):Slow Query Log $(date '+%F')" -a $log_file < /dev/null
