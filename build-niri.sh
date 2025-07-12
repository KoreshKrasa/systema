#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf -y copr enable atim/lazygit
dnf -y copr enable yalter/niri
dnf -y copr enable solopasha/hyprland
dnf -y copr enable lihaohong/yazi

dnf -y remove firefox firefox-langpacks
dnf -y install $(cat /tmp/pkgs | sed -e 's/\s*#.*$//' | sed -e '/^\s*$/d')

dnf -y copr disable atim/lazygit
dnf -y copr disable yalter/niri
dnf -y copr disable solopasha/hyprland
dnf -y copr disable lihaohong/yazi

systemctl enable podman.socket
systemctl enable emptty.service

mkdir /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/waybar.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/mako.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/swww.service /usr/lib/systemd/user/niri.service.wants
