#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

for f in `ls /tmp/build/*.sh | sort -V`; do
  bash -e "$f"
done
