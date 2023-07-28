FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

COPY jupyterhub_config.py /

# install mamba

RUN apt update
RUN apt install -y wget
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
RUN bash Mambaforge-Linux-x86_64.sh -bup /opt/mambaforge

# install packages

RUN source /opt/mambaforge/etc/profile.d/conda.sh && \
    conda init && \
    source ~/.bashrc && \
    conda create -y -n jupyterhub39 python=3.9 && \
    conda activate jupyterhub39 && \
    mamba install -y -c conda-forge jupyterhub jupyterlab notebook jupyter_client && \
    mamba install -y -c bioconda mafft fasttree circlator

COPY make_users.sh /tmp/
COPY users.txt /tmp/

# create users

RUN user="jupyterhub_admin" && \
     pw="password-0" && \
     useradd -m $user && \
     echo "${user}:${pw}" | chpasswd && \
     mkdir -p -m 777 /home/${user}/notebook && \
     chown ${user}: /home/${user}/notebook

RUN bash /tmp/make_users.sh
