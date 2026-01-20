dnf -y copr enable ryanabx/cosmic-epoch
dnf -y install cosmic-desktop
dnf -y copr disable ryanabx/cosmic-epoch

systemctl enable cosmic-greeter.service
