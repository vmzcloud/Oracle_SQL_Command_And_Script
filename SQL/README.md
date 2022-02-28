# SQL Statement

## How To Get The Character Set Of A Database In Oracle

    select * from nls_database_parameters where parameter='NLS_CHARACTERSET';
    
Result:

    select * from nls_database_parameters where parameter='NLS_CHARACTERSET';

    PARAMETER VALUE
    --------------------- ------------
    NLS_CHARACTERSET AL32UTF8
