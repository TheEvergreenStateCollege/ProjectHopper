#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo 'Usage: "./savesql.sh SQLFILE.SQL DATABASE" where SQLFILE.SQL is your SQL file to create, and DATABASE is the name of the database to export.'
    exit 1
fi


$sqlfile = $1
$dbname = $2

mysqldump -u root $dbname > $sqlfile