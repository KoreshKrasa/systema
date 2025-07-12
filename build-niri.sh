#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf -y copr enable atim/lazygit
dnf -y copr enable yalter/niri

dnf -y remove firefox firefox-langpacks
dnf -y install $(cat /tmp/pkgs | sed -e 's/\s*#.*$//' | sed -e '/^\s*$/d')

dnf5 -y copr disable atim/lazygit
dnf5 -y copr disable yalter/niri

systemctl enable podman.socket
systemctl enable emptty.service

mkdir /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/cosmic-bg.service /usr/lib/systemd/user/niri.service.wants/cosmic-bg.service
ln -s /usr/lib/systemd/user/cosmic-bg.service /usr/lib/systemd/user/niri.service.wants/cosmic-panel.service
