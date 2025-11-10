Console -> physical terminal or a kernel-implemented terminal device that is directly connected to a computer, often serving as the primary interface for system administration and low-level operations such as accessing the BIOS or boot loader.
It can also refer to virtual consoles accessible via keyboard shortcuts on systems like Linux, which function similarly to physical consoles.
Does outputs.


Terminal ->  wrapper program which runs a shell into which we can enter commands. Enables both inputs (instructions) and outputs (visual return). 
Now you have programs such as Gnome Terminal which launches a window in a Gnome windowing environment which will run a shell into which you can enter commands.


Shell -> program which actually processes commands and returns output. Most shells also manage foreground and background processes, command history and command line editing. 
These features (and many more) are standard in bash, the most common shell in modern linux systems.


Command -> specific instruction entered by the user to perform a task, typically expressed as a sequence of characters—usually a command name followed by parameters.
For example: "ls" is the main command to display a list. It can be followed by an (or many) argument such as below.


Argument -> value or parameter passed to a command to modify its behavior or specify the data it should operate on.
For example: in the command ls -l /home, ls is the command, -l is an argument (option), and /home is another argument (the target directory).


Command processing workflow : 

 1) A user types a command into a terminal.

 2) The terminal captures the keystrokes and sends them to the shell. 

 3) The shell then interprets the command and its arguments, checks the command's location in the system's PATH, and executes the corresponding program. 

 4) The shell may handle tasks such as command-line editing, history, and job control before passing the command to the operating system kernel via system calls. 

 5) The program runs, produces output (or errors), and the shell displays the results back to the user through the terminal. 

 6) The terminal manages the display of output, scrollback history, and input handling, while the shell manages the execution environment and command interpretation.
