#!/bin/bash
#alex alvonellos
# Nov 21, 2021
#purpose: rebuild and re-initialize the database

#global var section
DB_FILENAME="../db/logger.db"
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
	exit 1
	;;
    "MKDIR")
	echo >&2 '
	******** Error making logger-old. Directory locked? ********
	******** Error code MKDIR ********'
	exit 1
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
FUNCTION_LOCATION='MKDIR'
if [[ -d "../db/logger-old" ]]; then
	echo "logger-old already exists, moving on..."
else
	echo "logger.old doesn't exist, making logger-old dir..."
	mkdir "../db/logger-old"
fi

FUNCTION_LOCATION='CPDB'
if [[ -f "logger.db" ]]; then
	echo "logger.db exists, backing up to logger-old\logger.db_${TIMESTAMP}"
	`cp "../db/logger.db" "../db/logger-old/logger_${TIMESTMP}"`
else
	echo "logger.db doesn't exist, creating..."
	touch ../db/logger.db
fi

FUNCTION_LOCATION='CRDB'
echo "creating database"
sqlite3 ${DB_FILENAME} < ${SQL_FILENAME}



#error handling stuff
trap : 0
echo >&2 ' 
******* DONE *******
'

