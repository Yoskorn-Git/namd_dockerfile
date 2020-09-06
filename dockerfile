#Install Images
FROM ubuntu:18.04

#Install libs
RUN	apt-get update 
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y gcc-8 g++-8
RUN apt-get install -y cmake

#Install libs (PSXE needed)
#RUN apt-get install -y libgtk2.0
RUN apt-get install -y cpio
RUN apt-get install -y libgtk-3*
RUN apt-get install -y libxss1*
RUN apt-get install -y libnss3
RUN apt-get install -y libasound2

#Set up directory
RUN mkdir /home/cluster \
    && mkdir /home/cluster/thor \
    && mkdir /home/cluster/thor/code \
    && mkdir /home/cluster/thor/application \
    && mkdir /home/cluster/thor/application/mpi
	
# #Clone git charm.git, namd.git
RUN git clone --bare https://github.com/UIUC-PPL/charm.git	\
	/home/github/charm.git 
RUN git clone --bare https://charm.cs.illinois.edu/gerrit/namd.git \			
	/home/github/namd.git 

# #Download fftw3ls
RUN	mkdir /home/code && cd /home/code \
    && wget http://www.fftw.org/fftw-3.3.8.tar.gz

# #Download and Untar hpcx v2.6.0
RUN	cd /home/cluster/thor/application/mpi \
    && wget http://content.mellanox.com/hpc/hpc-x/v2.6/hpcx-v2.6.0-gcc-MLNX_OFED_LINUX-4.7-1.0.0.1-redhat7.7-x86_64.tbz \
    && tar -xvf hpcx-v2.6.0-gcc-MLNX_OFED_LINUX-4.7-1.0.0.1-redhat7.7-x86_64.tbz 

#Download Intel parallel studio XE 2020 update 1
RUN	mkdir /home/download && cd /home/download \
    && wget http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/16526/parallel_studio_xe_2020_update1_cluster_edition.tgz \
    && tar -xvf parallel_studio_xe_2020_update1_cluster_edition.tgz \
    && cd /home/download/parallel_studio_xe_2020_update1_cluster_edition \
    && rm silent.cfg \
    && wget https://transfer.sh/Bvg34/silent.cfg




