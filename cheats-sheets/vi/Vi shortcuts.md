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


  
Sure. Here are the top 100 most useful Vim shortcuts, grouped into different sections:

### Editing

|Shortcut|Description|
|---|---|
|`i`|Enter insert mode|
|`a`|Enter append mode|
|`o`|Open a new line below|
|`O`|Open a new line above|
|`<CR>`|Insert a newline character and enter normal mode|
|`^p`|Paste the contents of the previous register|
|`^r`|Replace the previous command|
|`.`|Repeat the previous command|
|`J`|Join the previous two lines|
|`C-_`|Delete the previous word|
|`C-x C-k`|Delete the current line and append it to the register|
|`C-y`|Yank the contents of the register|
|`<Esc>`|Return to normal mode|
|`hjkl`|Move the cursor up, down, left, and right|
|`{,}`|Move to the beginning and end of the current sentence|
|`[,]`|Move to the beginning and end of the current word|
|`f,F`|Move forward and backward one character|
|`t,T`|Move forward and backward to the next character that matches the current character|
|`;,,`|Repeat the previous search|
|`:s/old/new/`|Substitute the current word with `new`|
|`:%s/old/new/g`|Substitute all occurrences of `old` with `new`|
|`:g/old/p`|Print all occurrences of `old`|
|`:%s/old/new/gc`|Substitute all occurrences of `old` with `new` and confirm each substitution|

drive_spreadsheetExport to Sheets

### Insert

|Shortcut|Description|
|---|---|
|`a`|Append text after the cursor|
|`i`|Insert text before the cursor|
|`o`|Open a new line and insert text after it|
|`O`|Open a new line and insert text before it|
|`A`|Append text to the end of the line|
|`I`|Insert text at the beginning of the line|
|`R`|Insert text in replace mode|
|`ESC`|Exit insert mode|
|`:`|Enter command mode|

drive_spreadsheetExport to Sheets

### Search

|Shortcut|Description|
|---|---|
|`/`|Begin a search|
|`n`|Repeat the previous search|
|`N`|Repeat the previous search in the opposite direction|
|`*`|Search for the word under the cursor|
|`?`|Search for the word under the cursor backward|
|`g*`|Search for all occurrences of the current word|
|`%s/old/new/g`|Substitute all occurrences of `old` with `new`|
|`:nohlsearch`|Clear search highlighting|
|`:set hlsearch`|Enable search highlighting|
|`:set incsearch`|Enable incremental search|

drive_spreadsheetExport to Sheets

### Visual

|Shortcut|Description|
|---|---|
|`v`|Enter visual mode|
|`V`|Enter visual line mode|
|`<CR>`|Toggle visual block mode|
|`+,-`|Increase and decrease the size of the current visual selection|
|`^`|Select the beginning of the current line|
|`$`|Select the end of the current line|
|`w,b,e,ge`|Select the current word, current word backward, current sentence, and current paragraph, respectively|
|`J`|Join the selected lines|
|`C-y`|Copy the selected text to the register|
|`p`|Paste the contents of the register|
|`dd`|Delete the selected lines|
|`yy`|Yank the selected lines|
|`u`|Undo the previous change|
|`U`|Redo the previous change|
|`<Esc>`|Exit visual mode|

drive_spreadsheetExport to Sheets

### Ex

|Shortcut|Description|
|---|---|
|`:q`|Quit Vim|
|`:wq`|Write and quit Vim|
|`:w`|Write the current file|
|`:e filename`|Edit the specified file|
|`:set nu`|Enable line numbering|
|`:set nonu`|Disable line numbering|
|`:set autoindent`|Set|




