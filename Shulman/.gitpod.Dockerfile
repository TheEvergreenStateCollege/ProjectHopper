# Project Hopper 
# By Seth Leichsenring
# For: https://github.com/TheEvergreenStateCollege/ProjectHopper
# See: https://docs.docker.com/engine/reference/builder/ 
FROM gitpod/workspace-full:latest

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y  ghc ghc-prof ghc-doc \
                        haskell-platform       

USER $USER