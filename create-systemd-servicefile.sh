#! /bin/bash

cat > /etc/systemd/system/beritan-flask.service << 'EOF'
[Unit]
Description=Beritan Flask Application
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root/Beritan
Environment="PATH=/root/Beritan/venv/bin"
ExecStart=/root/Beritan/venv/bin/python /root/Beritan/app.py
Restart=always
RestartSec=3
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable beritan-flask
systemctl start beritan-flask
