export GUID=$(id -g)
export PUID=$(id -u)
export STORAGE="./services"

docker compose up \
  --detach