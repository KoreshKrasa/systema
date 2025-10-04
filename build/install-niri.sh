dnf -y copr enable yalter/niri-git
dnf -y install niri \
  xwayland-satellite \
  rofi-wayland \
  swww
dnf -y copr disable yalter/niri

mkdir /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/waybar.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/mako.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/swww.service /usr/lib/systemd/user/niri.service.wants
