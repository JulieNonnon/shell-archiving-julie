A console is a physical terminal or a kernel-implemented terminal device that is directly connected to a computer, often serving as the primary interface for system administration and low-level operations such as accessing the BIOS or boot loader.
It can also refer to virtual consoles accessible via keyboard shortcuts on systems like Linux, which function similarly to physical consoles

A terminal refers to a wrapper program which runs a shell. Decades ago, this was a physical device consisting of little more than a monitor and keyboard. 
As unix/linux systems added better multiprocessing and windowing systems, this terminal concept was abstracted into software. Now you have programs such as Gnome Terminal which launches a window in a Gnome windowing environment which will run a shell into which you can enter commands.

The shell is the program which actually processes commands and returns output. Most shells also manage foreground and background processes, command history and command line editing. 
These features (and many more) are standard in bash, the most common shell in modern linux systems.

A command is a specific instruction entered by the user to perform a task, typically expressed as a sequence of characters—usually a command name followed by parameters.

An argument is a value or parameter passed to a command to modify its behavior or specify the data it should operate on.
For example, in the command ls -l /home, ls is the command, -l is an argument (option), and /home is another argument (the target directory).

The command processing workflow begins when a user types a command into a terminal. The terminal captures the keystrokes and sends them to the shell.
 The shell then interprets the command and its arguments, checks the command's location in the system's PATH, and executes the corresponding program.
 The shell may handle tasks such as command-line editing, history, and job control before passing the command to the operating system kernel via system calls.
 The program runs, produces output (or errors), and the shell displays the results back to the user through the terminal.
 The terminal manages the display of output, scrollback history, and input handling, while the shell manages the execution environment and command interpretation.
