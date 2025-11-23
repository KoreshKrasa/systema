dnf -y copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

dnf -y install niri \
  xwayland-satellite \
  waybar \
  rofi \
  swww
dnf -y remove fuzzel
dnf -y copr disable yalter/niri-git

mkdir /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/waybar.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/mako.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/swww.service /usr/lib/systemd/user/niri.service.wants
