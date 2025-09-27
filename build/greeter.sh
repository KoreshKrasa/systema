# dnf -y --setopt=install_weak_deps=False install cosmic-greeter
# systemdctl enable cosmic-greeter.service

dnf -y install tuigreet

greetd_config=$(cat <<EOF
[terminal]
vt = 1

[default_session]
command = "tuigreet --cmd niri-session"
user = "greeter"
EOF
)
echo "$greetd_config" > /etc/greetd/config.toml
