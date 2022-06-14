#!/bin/bash

if [[ $# -ne 2 ]] ; then
    echo 'Usage: "./startsql.sh SQLFILE.SQL DATABASE" where SQLFILE.SQL is your SQL file to import, and DATABASE is the name of the database to import.'
    exit 1
fi


$sqlfile = $1
$dbname = $2

# Start the Mariadb daemon
cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql' &

echo 'MySQL Daemon started'

# Import a sql file. 
mysql -u root -R --triggers $dbname < $sqlfile 