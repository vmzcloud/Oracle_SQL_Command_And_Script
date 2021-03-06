export ORACLE_SID=DEV
export ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1

check_stat=`ps -ef|grep DEV|grep pmon|wc -l`;
oracle_num=`expr $check_stat`
if [ $oracle_num -lt 1 ]
then
   echo "DEV database instance is not running on this node"
   exit 0
fi

BACKUP_HOME=/u01/ora_backup/RMAN/DEV
DATE=$(date +%Y_%m_%d)
LOGDATE=$(date +%Y_%m_%d_%a_%H_%M)
mkdir -p $BACKUP_HOME/$DATE
BKUP_DB_FILE=$BACKUP_HOME/$DATE/%d_data_%T_%t_s%s_p%p.bak
BKUP_ARCH_LOG=$BACKUP_HOME/$DATE/%d_arch_%T_%t_s%s_p%p.bak
BKUP_CTRL_FILE=$BACKUP_HOME/$DATE/%d_cf_%T_%t_s%s_p%p.bak
BKUP_SP_FILE=$BACKUP_HOME/$DATE/%d_spf_%T_%t_s%s_p%p.bak

$ORACLE_HOME/bin/rman target / log=$BACKUP_HOME/$DATE/rman_$LOGDATE_$ORACLE_SID.log<< EOF
DELETE FORCE NOPROMPT BACKUP;
BACKUP AS COMPRESSED BACKUPSET FULL DATABASE FORMAT '$BKUP_DB_FILE';
BACKUP AS COMPRESSED BACKUPSET ARCHIVELOG ALL FORMAT '$BKUP_ARCH_LOG';
BACKUP CURRENT CONTROLFILE FORMAT '$BKUP_CTRL_FILE';
BACKUP SPFILE FORMAT '$BKUP_SP_FILE';
EOF
