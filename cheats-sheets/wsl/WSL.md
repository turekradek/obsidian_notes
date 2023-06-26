wsl problems 
https://www.youtube.com/watch?v=zyd_7tMKQh4

---

export import wsl image 
[Export and import Windows Subsystem for Linux (WSL) – 4sysops](https://4sysops.com/archives/export-and-import-windows-subsystem-for-linux-wsl/)

```
Wsl --list

wsl --export <WSL Image Name> <Export file>

wsl –-import <Image Name you choose> <Directory to store and run the image> <Directory location of the exported .tar file>

wsl -d <WSL imported image name>
```


sudo update-alternatives --config python3

ls -ls /usr/bin/python*   