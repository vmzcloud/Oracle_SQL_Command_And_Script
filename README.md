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
