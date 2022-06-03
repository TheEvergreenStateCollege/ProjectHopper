# Project Hopper 
# By Seth Leichsenring
# For: https://github.com/TheEvergreenStateCollege/ProjectHopper
# See: https://docs.docker.com/engine/reference/builder/ 
FROM gitpod/workspace-full:latest

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y  git \
                        build-essential \
                        python3 \
                        ghc ghc-prof ghc-doc \
                        coq \
                        squeak-vm \
                        default-jdk \
                        ocaml \
                        swi-prolog \
                        rust-gdb \
                        golang

USER $USER

# ISABELLE
RUN curl -L -o Isabelle2021-1_linux.tar.gz https://isabelle.in.tum.de/dist/Isabelle2021-1_linux.tar.gz
RUN tar -xzf Isabelle2021-1_linux.tar.gz
RUN rm Isabelle2021-1_linux.tar.gz
