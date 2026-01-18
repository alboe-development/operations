export PGID=$(id -g)
export PUID=$(id -u)
export STORAGE="./storage"

docker compose up \
  --file ./compose-routing.yaml \
  --detach
