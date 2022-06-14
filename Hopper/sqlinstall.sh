#!/bin/bash
echo "Create mariadb configuration file"
echo "[mysqld]" > /home/mysql/data/mariadb.cnf
echo "port=3306" >> /home/mysql/data/mariadb.cnf
echo "socket=/home/mysql/app/mariadb.socket" >> /home/mysql/data/mariadb.cnf
echo "pid-file=/home/mysql/app/mariadb.pid" >> /home/mysql/data/mariadb.cnf
echo "datadir=/home/mysql/data/db" >> /home/mysql/data/mariadb.cnf
echo "symbolic-links=0" >> /home/mysql/data/mariadb.cnf
echo "bind-address=0.0.0.0" >> /home/mysql/data/mariadb.cnf
echo "console=1" >> /home/mysql/data/mariadb.cnf
echo "general_log=0" >> /home/mysql/data/mariadb.cnf
echo "general_log_file==/home/mysql/data/log/mariadb.log" >> /home/mysql/data/mariadb.cnf
echo "log_error=/home/mysql/data/log/mariadb_error.log" >> /home/mysql/data/mariadb.cnf
echo "collation-server=utf8mb4_general_ci" >> /home/mysql/data/mariadb.cnf
echo "character-set-server=utf8mb4" >> /home/mysql/data/mariadb.cnf