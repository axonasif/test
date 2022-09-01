FROM gitpod/workspace-full:latest

USER root

RUN dir_path="/base/store" \
	&& mkdir -p "$dir_path" \
	&& chown -hR gitpod:gitpod /base

USER gitpod