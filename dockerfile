#Install Images
FROM ubuntu:18.04

#Install libs
RUN	apt-get update 
RUN apt-get install -y git 
RUN apt-get install -y wget 
RUN apt-get install -y gcc-8 
RUN apt-get install -y cmake

#Set up directory
RUN mkdir /home/cluster \
    && mkdir /home/cluster/thor \
    && mkdir /home/cluster/thor/code \
    && mkdir /home/cluster/thor/application \
    && mkdir /home/cluster/thor/application/mpi
	
#Clone git charm.git, namd.git
RUN git clone --bare https://github.com/UIUC-PPL/charm.git	\
	/home/github/charm.git 
RUN git clone --bare https://charm.cs.illinois.edu/gerrit/namd.git \			
	/home/github/namd.git 

#Download hcp-x and fftw3
RUN	cd / && mkdir code && cd code
RUN wget http://content.mellanox.com/hpc/hpc-x/v2.6/hpcx-v2.6.0-gcc-MLNX_OFED_LINUX-4.7-1.0.0.1-redhat7.7-x86_64.tbz
RUN wget http://www.fftw.org/fftw-3.3.8.tar.gz

#Untar hpcx v2.6.0
RUN tar -xf /home/code/hpcx-v2.6.0-gcc-MLNX_OFED_LINUX-4.7-1.0.0.1-redhat7.7-x86_64.tbz /home/cluster/thor/application/mpi


#Download Intel parallel studio XE 2020 update 1
RUN	cd / && mkdir download && cd download
# RUN wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/16526/parallel_studio_xe_2020_update1_cluster_edition.tgz



