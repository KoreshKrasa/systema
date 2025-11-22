sudo dnf -y config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf -y install mullvad-vpn
sudo systemctl start mullvad-daemon
