#!/bin/bash
#alex alvonellos
# Nov 21, 2021
#purpose: rebuild and re-initialize the database

#global var section
DB_FILENAME="logger.db"
SQL_FILENAME="init_db.sql"
TIMESTMP=`date +%y%m%d-%H%M%S`

FUNCTION_LOCATION=" "


#function helper section
abort_error()
{ 
    
    case $FUNCTION_LOCATION in 

    "CPDB")
    	echo >&2 ' 
    	******** Error moving database. Is it locked? *******
    	******** error code: CPDB *******'
    	exit 1
	;;

    "CRDB")
	echo >&2 ' 
	******* Error creating schema. Is db locked or in use? *******
	******* Error code: CRDB ********'
	;;
    *)
	echo >&2 '
	******** Terminated due to unknown error ********'
	exit 1
	;;
    esac
}

#error handling stuff
trap 'abort_error' 0
set -e 

#script section

#move the database before creating a new one it. Timestamp it also
#idea here is to make a backup 1st. If it doesn't exist, touch it. 

FUNCTION_LOCATION='CPDB'
if [[ -f "logger.db" ]]; then
	`cp "logger.db" "logger_${TIMESTMP}"`
else
	touch logger.db
fi

FUNCTION_LOCATION='CRDB'
sqlite3 ${DB_FILENAME} < ${SQL_FILENAME}



#error handling stuff
trap : 0
echo >&2 ' 
******* DONE *******
'

