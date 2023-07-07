#VI #VIM #shortcutsyy
### Moving by Characters, Words and Tokens
The basic keys for moving the cursor by one character are:
-   **`h`** – move the cursor left
-   **`j`** – move the cursor down
-   **`k`** – move the cursor up
-   **`l`** – move the cursor right
You can also use these keys with a number as a prefix to move 
in a specified direction multiple times.
For example, if you run **`5j`** the cursor moves down 5 lines.
-   **`b`** – move to the start of a word
-   **`B`** – move to the start of a token
-   **`w`** – move to the start of the next word
-   **`W`** – move to the start of the next token
-   **`e`** – move to the end of a word
-   **`E`** – move to the end of a token

### Moving by Lines
-   **`0`** (zero) – jump to the beginning of the line
-   **`$`** – jump to the end of the line
-   **`^`** – jump to the first (non-blank) character of the line
-   **`#G`** / **`#gg`** / **`:#`** – move to a specified line number (replace **#** with the line number)

### Moving by Screens
The following commands are used as a quick way to move within the text
without scrolling.
-   **`Ctrl + b`** – move back one full screen
-   **`Ctrl + f`** – move forward one full screen
-   **`Ctrl + d`** – move forward 1/2 a screen
-   **`Ctrl + u`** – move back 1/2 a screen
-   **`Ctrl + e`** – move screen down one line (without moving the cursor)
-   **`Ctrl + y`** – move screen up one line (without moving the cursor)
-   **`Ctrl + o`** – move backward through the jump history
-   **`Ctrl + i`** – move forward through the jump history
-   **`H`** – move to the top of the screen (H=high)
-   **`M`** – move to the middle of the screen (M=middle)
-   **`L`** – move to the bottom of the screen (L=low)



## Inserting Text
-   **`i`** – switch to insert mode before the cursor
-   **`I`** – insert text at the beginning of the line
-   **`a`** – switch to insert mode after the cursor
-   **`A`** – insert text at the end of the line
-   **`o`** – open a new line below the current one
-   **`O`** – open a new line above the current one
-   **`ea`** – insert text at the end of the word
-   **`Esc`** – exit insert mode; switch to command mode
## Editing Text
-   **`r`** – replace a single character (and return to command mode)
-   **`cc`** – replace an entire line (deletes the line and moves into insert mode)
-   **`C`** / **`c$`** – replace from the cursor to the end of a line
-   **`cw`** – replace from the cursor to the end of a word
-   **`s`** – delete a character (and move into insert mode)
-   **`J`** – merge the line below to the current one with a space in between them
-   **`gJ`** – merge the line below to the current one with no space in between them
-   **`u`** – undo
-   **`Ctrl`** + **`r`** – redo
-   **`.`** – repeat last command
### Cutting, Copying And Pasting

-   **`yy`** – copy (yank) entire line
-   **`#yy`** – copy the specified number of lines
-   **`dd`** – cut (delete) entire line
-   **`#dd`** – cut the specified number of lines
-   **`p`** – paste after the cursor
-   **`P`** – paste before the cursor






### Visual Commands
Once you have selected the desired text in visual mode,
you can use one of the visual commands to manipulate it.
Some of them include:
-   **`y`** – yank (copy) the marked text
-   **`d`** – delete (cut) the marked text
-   **`p`** – paste the text after the cursor
-   **`u`** – change the market text to lowercase
-   **`U`** – change the market text to uppercase








## Search in File
-   **`*`** – jump to the next instance of the current word
-   **`#`** – jump to previous instance of the current word
-   **`/pattern`** – search forward for the specified pattern
-   **`?pattern`** – search backward for the specified pattern
-   **`n`** – repeat the search in the same direction
-   **`N`** – repeat the search in the opposite direction







