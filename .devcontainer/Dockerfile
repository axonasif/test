FROM mcr.microsoft.com/devcontainers/base:ubuntu

USER vscode
ENV HOME=/home/vscode
SHELL [ "/bin/bash", "-c" ]
RUN <<'SCRIPT'
set -eux
JB_DIR="$HOME/.local/share/JetBrains"
PLUGINS_DIR="$JB_DIR/plugins"

plugins=(
    "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=780441" # Copied from https://plugins.jetbrains.com/plugin/7808-terraform-and-hcl/versions/stable -> 2025.1.3
    "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=780445" # Copied from https://plugins.jetbrains.com/plugin/6351-dart/versions/stable -> 2025.1.3
)
ides=(
    "IntelliJIdea2025.1"
    "WebStorm2025.1"
)

mkdir -p "$PLUGINS_DIR" && cd "$PLUGINS_DIR"
for plugin in "${plugins[@]}"; do {
    curl -L "$plugin" -o /tmp/download
    unzip /tmp/download
} done

for ide in "${ides[@]}"; do {
    mkdir -p "$JB_DIR/$ide"
    ln -sf "$PLUGINS_DIR/"* "$JB_DIR/$ide/"
} done
SCRIPT