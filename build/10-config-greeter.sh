greetd_config=$(cat <<EOF
[terminal]
vt = 1

[default_session]
command = "/usr/bin/noctalia-greeter-session -- --session niri-session"
user = "greetd"
EOF
)
echo "$greetd_config" > /etc/greetd/config.toml
systemctl enable --force greetd
systemctl set-default graphical.target
