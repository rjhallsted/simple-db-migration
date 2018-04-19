#!/bin/bash
source .idd-db-migrate-config

DUMPDB="
source .idd-db-migrate-config;
mysqldump -u \$DB_USER -p\$DB_PASS \$DB_NAME > ${1}.sql;
gzip ${1}.sql;"

echo "Dumping db on server..."
echo $DUMPDB | ssh -l root $1 > /dev/null

echo "Copying db to local..."
scp root@${1}:/root/${1}.sql.gz ${1}.sql.gz
gunzip ${1}.sql.gz
echo "Importing db..."
mysql -u $DB_USER -p$DB_PASS $DB_NAME < ${1}.sql > /dev/null
rm ${1}.sql

echo "Cleaning up server..."
echo "rm ${1}.sql.gz" | ssh -l root $1 > /dev/null
