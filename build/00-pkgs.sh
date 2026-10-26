dnf -y copr enable yalter/niri-git
echo "priority=1" | sudo tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

sudo dnf install -y $(cat /tmp/data/install-pkg)
sudo dnf remove -y $(cat /tmp/data/remove-pkg)

dnf -y copr disable yalter/niri-git
