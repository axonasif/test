FROM gitpod/workspace-base

RUN <<EOR

sudo tee -a /etc/bash.bashrc <<'BASH'

# Set global environment variables
if mkdir -p /tmp/.jvmopts 2>/dev/null; then # Atomic lock, runs only once.
  export JAVA_TOOL_OPTIONS+=" -Dide.browser.jcef.enabled=false"
fi
BASH

EOR
