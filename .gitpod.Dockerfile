FROM gitpod/workspace-base

RUN <<EOR

sudo tee -a /etc/bash.bashrc <<'BASH'


export SOMETHING="$(echo hey)"
BASH

EOR

