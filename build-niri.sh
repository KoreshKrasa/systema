#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

dnf5 -y copr enable atim/lazygit
dnf5 -y copr enable yalter/niri

dnf5 -y remove firefox firefox-langpacks

dnf5 -y install fish helix steam-devices \
  libvirt jetbrains-mono-fonts nautilus gvfs-smb \
  lazygit ruff uv python3-lsp-server cargo rust-analyzer rustfmt \
  niri xwayland-satellite \
  btop lightdm-gtk \

dnf5 -y install /tmp/gamescope-dbus.rpm /tmp/inputplumber.rpm /tmp/gamescope.rpm

dnf5 -y copr disable atim/lazygit
dnf5 -y copr disable yalter/niri

systemctl enable podman.socket
