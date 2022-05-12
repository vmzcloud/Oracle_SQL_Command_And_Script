# How to Enable Active Data Guard Option

## Steps to Enable Active Data Guard Option

### 1. Cancel The Redo Apply Process
    SQL> ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
    
### 2. Shutdown and start the database in Mount Mode
    SQL> SHUTDOWN IMMEDIATE

    SQL> STARTUP MOUNT
    
### 3. Open the database in Read-Only Mode
If you do not use the Active Data Guard option, then you do not have to execute step 4

    SQL> ALTER DATABASE OPEN;
    
### 4. Start the Redo Apply. (Executing this Step will enable the Active Data Guard Option)
    SQL> ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT;
    
### 5. Check open_mode
    SQL> SELECT open_mode FROM V$DATABASE;

    OPEN_MODE
    --------------------
    READ ONLY WITH APPLY
