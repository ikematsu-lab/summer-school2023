FROM ubuntu:20.04

ENV PATH ~/miniconda3/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y \
 build-essential \
 bzip2 \
 wget \
 cmake \
 git \
 gcc \
 vim \
 make && apt clean

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py310_23.5.2-0-Linux-x86_64.sh -O ~/Miniconda.sh && \
 /bin/bash ~/Miniconda.sh -b -p ~/miniconda3 && \
 rm ~/Miniconda.sh && \
 echo ". ~/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
 echo "conda activate base" >> ~/.bashrc

RUN ~/miniconda3/bin/conda install -c conda-forge mamba -yq && ~/miniconda3/bin/mamba clean -a -y


RUN ~/miniconda3/bin/mamba install jupyterhub -y
RUN ~/miniconda3/bin/mamba install notebook -y

RUN ~/miniconda3/bin/mamba install -c bioconda mafft -y
RUN ~/miniconda3/bin/mamba install -c bioconda fasttree -y


RUN mkdir -p /opt/notebooks

#COPY ./config/jupyter_notebook_config.py /tmp/
COPY ./config/jupyterhub_config.py /tmp/
COPY ./users.txt /tmp/

Shell ["/bin/bash", "-c"]
WORKDIR /opt/notebooks
