unset http_proxy

conda activate jupyterhub39
jupyterhub -f jupyterhub_config.py --port 8888 --ip 0.0.0.0 --no-ssl
