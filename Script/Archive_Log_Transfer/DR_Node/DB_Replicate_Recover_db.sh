export ORACLE_SID=PROD
export ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1

check_stat=`ps -ef|grep PROD|grep pmon|wc -l`;
oracle_num=`expr $check_stat`
if [ $oracle_num -lt 1 ]
then
   echo "PROD database instance is not running on this node"
   exit 0
fi

$ORACLE_HOME/bin/rman target / log=log/DB_Replicate_Recover_db.log<< EOF
catalog start with '/u01/ora_backup/arch_log';
YES
recover database;
EOF
