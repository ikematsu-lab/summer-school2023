# summer-school2023

## Start Server

```bash

# Build Docker image
bash script/build.sh

# Run and attach to the Container
bash script/start.sh

# Handout sequences.fasta
bash /tmp/handouts.sh

# Start JupyterHub server
unset http_proxy
conda activate jupyterhub39
jupyterhub -f jupyterhub_config.py --port 8888 --ip 0.0.0.0 --no-ssl


```

## Login

Go to `<ip addr>:2024`

| Key | Value |
| :---: | :---: |
| User | user{01..50} |
| Password | summer2024 |


## How to Make Tree

```bash

mafft --auto sequences.fasta > align.fasta
FastTree -gtr align.fasta > tree.nwk


```


