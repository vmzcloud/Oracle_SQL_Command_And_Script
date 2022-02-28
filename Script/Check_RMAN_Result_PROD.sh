ORACLE_SID=PROD
export ORACLE_SID

ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
export ORACLE_HOME

check_stat=`ps -ef|grep PROD|grep pmon|wc -l`;
oracle_num=`expr $check_stat`
if [ $oracle_num -lt 1 ]
then
   echo "PROD database instance is not running on this node"
   exit 0
fi

$ORACLE_HOME/bin/sqlplus / as sysdba << EOF
spool /home/oracle/script/log/Check_RMAN_Result_PROD.log
col STATUS format a9
col hrs format 999.99
select
SESSION_KEY, INPUT_TYPE, STATUS,
to_char(START_TIME,'mm/dd/yy hh24:mi') start_time,
to_char(END_TIME,'mm/dd/yy hh24:mi')   end_time,
elapsed_seconds/3600                   hrs
from V\$RMAN_BACKUP_JOB_DETAILS
order by session_key;
exit
EOF
