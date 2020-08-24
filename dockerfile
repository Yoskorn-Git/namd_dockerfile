#Install Images
FROM ubuntu:18.04

RUN	apt-get update 
RUN apt-get install -y git 
RUN apt-get install -y wget 
RUN apt-get install -y gcc-8 
RUN apt-get install -y cmake

RUN mkdir /home/cluster \
    && mkdir /home/cluster/thor \
    && mkdir /home/cluster/thor/application \
    && mkdir /home/cluster/thor/application/mpi 
	
RUN git clone --bare https://github.com/UIUC-PPL/charm.git	\
	$HOME/github/charm.git 

RUN git clone --bare https://charm.cs.illinois.edu/gerrit/namd.git \			
	$HOME/github/namd.git 

RUN	cd $HOME && mkdir code
RUN wget http://content.mellanox.com/hpc/hpc-x/v2.6/hpcx-v2.6.0-gcc-MLNX_OFED_LINUX-4.7-1.0.0.1-redhat7.7-x86_64.tbz
RUN wget http://www.fftw.org/fftw-3.3.8.tar.gz






