#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

for f in /tmp/build/[!.]*.sh; do
  bash "$f"
done

systemctl enable podman.socket
systemctl enable emptty.service
