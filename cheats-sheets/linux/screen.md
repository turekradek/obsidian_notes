
screen -A -m -d -S name
 -A   Adapt  the sizes of all windows to the size of the current terminal.  By default, screen tries to restore its old window sizes when attaching to resizable terminals (those with "WS" in its de‐
            scription, e.g. suncmd or some xterm).
 -d -m   Start screen in "detached" mode. This creates a new session but doesn't attach to it. This is useful for system startup scripts.