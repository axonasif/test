FROM alpine:3.18.2

RUN apk add --no-cache \
    git\
    bash \
    sudo  \
    docker \
    iptables\
    libgcc \
    gcompat \
    libstdc++ gcc\
    && echo '%gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod \
    && addgroup -g 33333 gitpod && adduser -u 33333 -G gitpod -h /home/gitpod -s /bin/bash -D gitpod

USER gitpod
RUN sudo apk add --no-cache curl \
    && curl -fsSL https://sh.rustup.rs | sh -s -- -y
