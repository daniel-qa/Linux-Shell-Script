#!/bin/bash
# mysq db dump , and data rsync 

if [ 10 -lt 20 ]
then
        # DB1
        myHost="localhost"
        myUser="root"
        myPass="123456"
        myDB="db1_tw"

        backup_path="/opt/py/"
        #date=$(date +"%Y%m%d")
        #sql_file=$backup_path"myDB."$date".sql"
        sql_file=$backup_path"db1_tw.sql"

        echo "mysqldump..."
        /opt/lampp/bin/mysqldump -h $myHost -u $myUser -p$myPass $myDB > $sql_file
        echo $sql_file

        # rsync to NAS
        rsync -av --password-file=rsyncd.secrets /opt/py/db1_tw.sql    user@host::DB/TW/
fi

if [ 10 -lt 20 ]
then
        # DB2
        myHost="localhost"
        myUser="root"
        myPass="123456"
        myDB="db2_en"

        backup_path="/opt/py/"
        #date=$(date +"%Y%m%d")
        sql_file=$backup_path"db2_en.sql"

        echo "mysqldump..."
        /opt/lampp/bin/mysqldump -h $myHost -u $myUser -p$myPass $myDB > $sql_file
        echo $sql_file

        # rsync to NAS
        rsync -av --password-file=rsyncd.secrets /opt/py/db2_en.sql    user@host::DB/EN/
fi

