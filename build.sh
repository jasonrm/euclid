#!/bin/sh
set -o xtrace
set -o errexit
set -o pipefail

DEPS="ca-certificates"
BUILD_DEPS="curl"
apk add --update ${DEPS} ${BUILD_DEPS}

curl -# -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl

# Create non-root user (with a randomly chosen UID/GUI).
UID=$(shuf -i 2000-9000 -n 1)
adduser kubectl -Du $UID -h /home/kubectl

# Cleanup
apk del ${BUILD_DEPS}
rm -rf /var/cache/apk/*
rm /$0
