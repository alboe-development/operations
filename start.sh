export PGID=$(id -g)
export PUID=$(id -u)
export STORAGE="./storage"

docker compose up \
  --detach