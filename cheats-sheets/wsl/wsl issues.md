
1

[](https://superuser.com/posts/1761660/timeline)

> I did install zsh, and I hated it so I removed it

It looks like you may have forgotten to reset your shell to Bash, though. So after uninstalling Zsh, WSL is still attempting to start it but failing to find it. This would be the same with "normal" Debian as well, but with a slightly different message. WSL makes it a bit easier to recover, though.

Try:

```
wsl ~ -e chsh
```

Set it to `/usr/bin/bash` and then try starting again.

The `-e` is the application that you want WSL to run initially as the "shell". You could also start with:

```
wsl ~ -e bash
```