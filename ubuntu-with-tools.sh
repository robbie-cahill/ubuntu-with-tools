#!/usr/bin/env bash
docker run --rm -it --name my-ubuntu-container -v $HOME:/home/ubuntu/ ubuntu-with-tools bash -c "cd $(pwd | sed 's|^'"$HOME"'|/home/ubuntu|') && exec bash"

