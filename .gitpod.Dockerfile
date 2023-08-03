FROM alpine:3.18.2

RUN apk add \
        bash \
        sudo \
        docker \
        gcompat \
        libgcc \
        libstdc++ \
        iptables \
        
    # Add gitpod user
    && echo '%gitpod ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/gitpod \
    && addgroup -g 33333 gitpod && adduser -u 33333 -G gitpod -h /home/gitpod -s /bin/bash -D gitpod