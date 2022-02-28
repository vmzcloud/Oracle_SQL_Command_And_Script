ORACLE_SID=PROD
export ORACLE_SID

check_stat=`ps -ef|grep PROD|grep pmon|wc -l`;
oracle_num=`expr $check_stat`
if [ $oracle_num -lt 1 ]
then
   echo "PROD database instance is not running on this node"
   exit 0
fi

ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
export ORACLE_HOME

$ORACLE_HOME/bin/sqlplus / as sysdba << EOF
spool /home/oracle/script/log/SwitchLog.log
archive log list;
alter system switch logfile;
exit
EOF
