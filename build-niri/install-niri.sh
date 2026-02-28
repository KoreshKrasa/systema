dnf -y copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

dnf -y install niri \
  xwayland-satellite
dnf -y remove fuzzel mako
dnf -y copr disable yalter/niri-git

mkdir /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/vicinae.service /usr/lib/systemd/user/niri.service.wants
ln -s /usr/lib/systemd/user/noctalia.service /usr/lib/systemd/user/niri.service.wants
