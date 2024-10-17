FROM gitpod/workspace-full

RUN data="$(curl -sSL "https://raw.githubusercontent.com/axonasif/bashenv.zsh/87cf0ce8dc54b0feb39142a28a1d569841b61ca8/src/lib.sh")bashenv.zsh" \
    && echo "$data" >> ~/.zshrc
