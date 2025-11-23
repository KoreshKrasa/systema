dnf -y install walker elephant elephant-calc elephant-clipboard elephant-desktopapplications elephant-files elephant-menus elephant-runner elephant-websearch

systemd_service=$(cat <<EOF
[Unit]
Description=Elephant
After=graphical-session.target

[Service]
Type=simple
ExecStart=elephant
Restart=on-failure

[Install]
WantedBy=graphical-session.target
EOF
)
echo "$systemd_service" > /usr/lib/systemd/user/elephant.service
ln -s /usr/lib/systemd/user/elephant.service /usr/lib/systemd/user/niri.service.wants
