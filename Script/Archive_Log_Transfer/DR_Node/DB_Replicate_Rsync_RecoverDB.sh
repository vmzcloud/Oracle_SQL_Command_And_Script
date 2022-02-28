rsync -chavzP -e "ssh" oracle@10.34.56.78:/u01/app/oracle/fast_recovery_area/PROD/archivelog/ /u01/ora_backup/arch_log/ > /home/oracle/script/log/DB_Replicate_Rsync.log 2>&1

export ORACLE_SID=PROD
export ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1

check_stat=`ps -ef|grep PROD|grep pmon|wc -l`;
oracle_num=`expr $check_stat`
if [ $oracle_num -lt 1 ]
then
   echo "PROD database instance is not running on this node"
   exit 0
fi

$ORACLE_HOME/bin/rman target / log=/home/oracle/script/log/DB_Replicate_Recover_db.log<< EOF
catalog start with '/u01/ora_backup/arch_log';
YES
recover database;
EOF
