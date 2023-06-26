sudo nano /etc/wsl.conf
```systemd
[boot]
systemd=true
```
after this step restart wsl 
```wsl.exe --shutdown
```

```not_nessasary
[automount]
enabled = true
options = "metadata,uid=1000, gid=1000,umask=22,fmask=11,case=off"
mountFsTab = true
```

```network
[network]
generateHosts = true
generateResolvConf = true
hostname = fedora
```

```user
[user]
default=user
```

```gui_KDE
sudo dnf -y groupinstall 'Basic Desktop' KDE
```

```gui_GNOME
sudo dnf -y groupinstall 'Basic Desktop' GNOME
```

```locale_with_root
localectl set-locale LANG="en_US.UTF-8"
```

```
sudo dnf -y install xrdp
```

```
sudo systemctl enable xrdp
```

```fedora_is_hostname
wsl.exe --terminate fedora
```

- [ ] run wsl one more time
- [ ] remote desktop connection
	- [ ] computer host
	- [ ] user name user
		- [ ] allow me to save credentials
		- [ ] password
	- [ ] do not ask me again

Windows
- [ ] Apps > Apps & features wsl distro
	- [ ] wsl distro for wsl systemD no window 
		- [ ] off
		- [x] on