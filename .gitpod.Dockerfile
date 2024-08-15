FROM gitpod/workspace-base

RUN <<EOR

sudo tee -a /etc/bash.bashrc <<'BASH'
  export SOMETHING="$(time)"
BASH

EOR
