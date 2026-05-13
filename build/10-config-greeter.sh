greetd_config=$(cat <<EOF
[terminal]
vt = 1

[default_session]
command = "tuigreet --asterisks -r --cmd niri-session"
user = "greetd"
EOF
)
echo "$greetd_config" > /etc/greetd/config.toml
