Starting the vi Editor
There are following way you can start using vi editor :

Commands and their Description

vi filename: Creates a new file if it already not exist, otherwise opens existing file.
vi -R filename : Opens an existing file in read only mode.
view filename : Opens an existing file in read only mode.
Moving within a File(Navigation):
To move around within a file without affecting text must be in command mode (press Esc twice). Here are some of the commands can be used to move around one character at a time.

Commands and their Description

k : Moves the cursor up one line.
j : Moves the cursor down one line.
h : Moves the cursor to the left one character position.
l : Moves the cursor to the right one character position.
0 or | : Positions cursor at beginning of line.
$ : Positions cursor at end of line.
W : Positions cursor to the next word.
B : Positions cursor to previous word.
( : Positions cursor to beginning of current sentence.
) : Positions cursor to beginning of next sentence.
H : Move to top of screen.
nH : Moves to nth line from the top of the screen.
M : Move to middle of screen.
L : Move to bottom of screen.
nL : Moves to nth line from the bottom of the screen.
colon along with x : Colon followed by a number would position the cursor on line number represented by x.
Control Commands(Scrolling): There are following useful commands which can used along with Control Key:

Commands and their Description:

CTRL+d : Move forward 1/2 screen.
CTRL+f : Move forward one full screen.
CTRL+u : Move backward 1/2 screen.
CTRL+b : Move backward one full screen.
CTRL+e : Moves screen up one line.
CTRL+y : Moves screen down one line.
CTRL+u : Moves screen up 1/2 page.
CTRL+d : Moves screen down 1/2 page.
CTRL+b : Moves screen up one page.
CTRL+f : Moves screen down one page.
CTRL+I : Redraws screen.
Editing and inserting in Files(Entering and Replacing Text): To edit the file, we need to be in the insert mode. There are many ways to enter insert mode from the command mode.

i : Inserts text before current cursor location.
I : Inserts text at beginning of current line.
a : Inserts text after current cursor location.
A : Inserts text at end of current line.
o : Creates a new line for text entry below cursor location.
O : Creates a new line for text entry above cursor location.
r : Replace single character under the cursor with the next character typed.
R : Replaces text from the cursor to right.
s : Replaces single character under the cursor with any number of characters.
S :Replaces entire line.
Deleting Characters: Here is the list of important commands which can be used to delete characters and lines in an opened file.

X Uppercase: Deletes the character before the cursor location.
x Lowercase : Deletes the character at the cursor location.
Dw : Deletes from the current cursor location to the next word.
d^ : Deletes from current cursor position to the beginning of the line.
d$ : Deletes from current cursor position to the end of the line.
Dd : Deletes the line the cursor is on.
Copy and Past Commands: Copy lines or words from one place and paste them on another place by using the following commands.

Yy : Copies the current line.
9yy : Yank current line and 9 lines below.
p : Puts the copied text after the cursor.
P : Puts the yanked text before the cursor.
Save and Exit Commands of the ex Mode : Need to press [Esc] key followed by the colon (:) before typing the following commands:

q : Quit
q! : Quit without saving changes i.e. discard changes.
r fileName : Read data from file called fileName.
wq : Write and quit (save and exit).
w fileName : Write to file called fileName (save as).
w! fileName : Overwrite to file called fileName (save as forcefully).
!cmd : Runs shell commands and returns to Command mode.
Searching and Replacing in (ex Mode): vi also has powerful search and replace capabilities. The formal syntax for searching is:

:s/string 
For example, suppose we want to search some text for the string “geeksforgeeks” Type the following and press ENTER:

:s/geeksforgeeks