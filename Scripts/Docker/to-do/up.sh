#!/bin/bash

docker compose -f $HOME/Documents/Repos/FJrodafo/to-do/App/docker-compose.yaml up -d

echo -e '\nOpen To-do App --> \033[1mhttp://localhost:3000\033[0m\n'