# Oracle SQL Command And Script

## Login as sysdba

    su - oracle
  
    export ORACLE_SID=PROD
  
    sqlplus / as sysdba
    
    SQL>
    
## Connecting RMAN

    su - oracle
    
    export ORACLE_SID=PROD
    
    rman target /
    
    RMAN>
    
## Delete Archive Log

Connect to RMAN

    RMAN> delete noprompt archivelog until time 'SYSDATE-10'; 

## Check Oracle Version

Connect with sqlplus

    SQL> select banner_full from v$version;
    
    BANNER_FULL
    --------------------------------------------------------------------------------
    Oracle Database 19c Standard Edition 2 Release 19.0.0.0.0 - Production
    Version 19.13.0.0.0
