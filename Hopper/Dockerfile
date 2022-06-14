# syntax=docker/dockerfile:1

# Project Hopper Dockerfile
# Revision 0.0.4
# By Seth Leichsenring
# For: https://github.com/TheEvergreenStateCollege/ProjectHopper
# See: https://docs.docker.com/engine/reference/builder/ 
FROM debian:latest

EXPOSE 22/tcp
EXPOSE 22/udp

ARG DEBIAN_FRONTEND=noninteractive
# Sherri - add current source for Squeak since the one in Debian repo is >10 years old
# RUN echo 'deb http://ftp.squeak.org testing/main Packages' >> /etc/apt/sources.list
# RUN echo 'deb-src http://ftp.squeak.org testing/main Sources' >> /etc/apt/sources.list


RUN apt-get update && apt-get upgrade -y

# A bunch of Richard's requirements
RUN apt-get install build-essential -y
RUN apt-get install python3 -y
RUN apt-get install openssh-server -y
RUN apt-get install nano -y
RUN apt-get install vim -y
RUN apt-get install emacs -y
RUN apt-get install gdb -y
RUN apt-get install valgrind -y
RUN apt-get install ghc ghc-prof ghc-doc -y 
RUN apt-get install curl -y
# Richard - Git
RUN apt-get install git -y
RUN apt-get install netcat-openbsd -y
# Richard - nmap
RUN apt-get install nmap -y
# Richard - Maria-db/Mysql

# Sherri: coq
RUN apt-get install coq -y
# Squeak for Sherri -- This is just the virtual machine and does not include an editor.
RUN apt-get install squeak-vm -y
RUN apt-get install default-jdk -y
# Sherri - OCAML
RUN apt-get install ocaml -y
# Sherri: SWI-Prolog
RUN apt-get install swi-prolog -y
# Sherri: RUST
RUN apt-get install rust-gdb -y
# Sherri: GO
RUN apt-get install golang -y
# .NET runtime for Alex. Might not be necessary.
RUN curl -L -o dotnet-install.sh https://dot.net/v1/dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh
# Sherri: Isabelle
RUN curl -o Isabelle2021-1_linux.tar.gz https://isabelle.in.tum.de/dist/Isabelle2021-1_linux.tar.gz
RUN tar -xzf Isabelle2021-1_linux.tar.gz
# Richard - Radare2
RUN apt-get install pip -y
RUN pip install -U r2env
RUN r2env init
RUN r2env add radare2@git
# Richard - Jupyterlab
RUN pip install jupyterlab

# Creating the user and group. The UID numbers here need to be above 1000 to avoid some odd behaviors with users that can login.
RUN groupadd -r mysql -g 1001
RUN useradd -m -s /bin/bash -g mysql -u 1001 -p "$(openssl passwd -1 mysql)" mysql

# Richard - MySQL installation and initialization.
RUN mkdir /docker-entrypoint-initdb.d
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mariadb-server mysql-server/root_password password rootpass'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mariadb-server mysql-server/root_password_again password rootpass'"]
ARG MARIADB_MYSQL_SOCKET_DIRECTORY='/run/mysqld'
RUN mkdir -p $MARIADB_MYSQL_SOCKET_DIRECTORY && chmod 775 $MARIADB_MYSQL_SOCKET_DIRECTORY

RUN apt-get -y install mariadb-server mariadb-client

# From the mariadb dockerfile: https://github.com/MariaDB/mariadb-docker/blob/master/10.9/Dockerfile
# purge and re-create /var/lib/mysql with appropriate ownership
RUN	rm -rf /var/lib/mysql
RUN	mkdir -p /var/lib/mysql /var/run/mysqld
RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN	chmod 777 /var/run/mysqld

# Listen on all ports.
RUN sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod u+s /usr/bin/mariadb
RUN chmod u+s /usr/bin/mysqld_safe
RUN chown root:mysql /etc/mysql/debian-start
RUN chown root:mysql /etc/mysql/debian.cnf
RUN chown root:mysql /etc/init.d/mariadb 

# Insert MOTD 
CMD rm /etc/motd
COPY motd.txt /etc/motd


# User creation
CMD chown -R mysql:mysql /home/mysql
CMD chmod -R 755 /home/mysql
USER mysql
WORKDIR /home/mysql

# From: https://stackoverflow.com/questions/59487182/mariadb-init-without-root-in-docker Modified to fit our deployment scheme
RUN mkdir /home/mysql/data \ 
    && mkdir /home/mysql/data/db \
    && mkdir /home/mysql/data/log \
    && mkdir /home/mysql/app \
    && touch /home/mysql/app/mariadb.pid \
    && touch /home/mysql/app/mariadb.socket
COPY sqlinstall.sh /home/mysql/sqlinstall.sh
RUN /home/mysql/sqlinstall.sh
RUN mysql_install_db --defaults-file=/home/mysql/data/mariadb.cnf
RUN rm /home/mysql/sqlinstall.sh

# Copy the start/stop scripts and apply the correct permissions
COPY startSql.sh /home/mysql/startsql.sh
#RUN chmod +x /home/mysql/startsql.sh
COPY README /home/mysql/README
COPY savesql.sh /home/mysql/savesql.sh
#RUN chmod +x /home/mysql/savesql.sh
CMD echo "cat /etc/motd" >>  /home/mysql/.bashrc
# Required to keep the container open after it is created. 

CMD while true; do sleep 1; done