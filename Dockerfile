# Project Hopper Dockerfile
# Revision 0.0.1
# By Seth Leichsenring
# For: https://github.com/TheEvergreenStateCollege/ProjectHopper
# See: https://docs.docker.com/engine/reference/builder/ 
FROM debian:11

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
RUN apt-get install mariadb-server -y
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

# User creation
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu -p "$(openssl passwd -1 ubuntu)"
USER ubuntu
WORKDIR /home/ubuntu
RUN /bin/bash
# Required to keep the container open after it is created. 
CMD while true; do sleep 1; done