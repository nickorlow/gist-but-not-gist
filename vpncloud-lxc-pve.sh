id=$1
tee -a "/etc/pve/lxc/$id.conf" << EOF
lxc.mount.entry: /dev/net dev/net none bind,create=dir
lxc.cgroup2.devices.allow: c 10:200 rwm
EOF

pct reboot "$id"
pct enter "$id"
