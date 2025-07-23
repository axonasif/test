#!/bin/bash

read -p "Registry: " reg
read -p "Username: " user
read -p "Password: " pass

export GITPOD_IMAGE_AUTH="$(printf "$reg:"; printf '%s:%s' "$user" "$pass" | base64 -w0)"

printf '%s\n' "================ COPY START ==================" "" "$GITPOD_IMAGE_AUTH" "" "============= COPY END =============="