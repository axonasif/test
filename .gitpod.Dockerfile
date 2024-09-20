FROM gitpod/workspace-base

RUN <<EOR

sudo tee -a /etc/bash.bashrc <<'BASH'

if mkdir /tmp/.jb_settings.lock 2>/dev/null; then # Atomic lock, runs only once.
  until test -e /workspace/.gitpod/ready; do
    sleep 1
  done

  target_dir="$HOME/.config/JetBrains/PyCharm2024.2.1"
  mkdir -p "$target_dir"
  echo "-Dide.browser.jcef.enabled=false" >>"$target_dir/pycharm64.vmoptions"
fi

BASH

EOR

