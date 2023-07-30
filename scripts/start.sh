docker run -it \
  -p 2023:8888 \
  -v $PWD/notebooks:/opt/notebooks  \
  --rm \
  summer-hub
