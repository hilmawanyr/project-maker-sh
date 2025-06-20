Project Structure Creator Script
This create_project shell script automates the creation of a predefined project folder structure, which can be executed globally on macOS, Linux, and Windows (via Git Bash or WSL).

Project Structure Generated
When you run the script, it will create a folder with the following structure:

|- run.dev.sh
|- run.prod.sh
src
|- app
|- |- bootstrap.ts
|- data
|- |- model
|- |- repository
|- domain
|- |- dtos
|- |- entities
|- |- repositories
|- |- usecases
|- handler
|- infra
|- |- job
|- |- |- event
|- |- |- queue
|- |- |- service
|- |- |- worker
|- |- config
|- |- |- database.conf.ts
|- |- |- types.ts
|- |- |- provider.ts
|- |- database
|- |- |- mysql.resolver.ts
|- |- helper
|- |- lib
|- |- locale
|- |- logger
|- |- middleware
|- |- port
|- |- |- database.interface.ts
|- |- |- services.interface.ts
|- |- server
|- |- service
|- router
|- main.ts
test
.env
.env.example

How to Make the Script Globally Executable
To use the create_project command from any directory in your terminal, you need to make the script executable and place it in your system's PATH.

For macOS and Linux
Save the Script:

Save the shell script content (from the Canvas document titled "Project Structure Creator Script with Location Argument") into a file named create_project.sh in your Home directory (~).

# Example: If you copied the content, you can create the file like this:
# nano ~/create_project.sh
# (Paste content, then Ctrl+O, Enter, Ctrl+X)

Give Execute Permissions:

Open your Terminal.

Run the following command to make the script executable:

chmod +x ~/create_project.sh

Move the Script to a PATH Directory:

It's best to move the script to a directory already included in your system's PATH variable, such as /usr/local/bin (for all users) or ~/bin (for the current user). If ~/bin doesn't exist, create it:

mkdir -p ~/bin

Then, move the script (renaming it to create_project for easier command line usage):

mv ~/create_project.sh ~/bin/create_project

Update PATH (if using ~/bin and not already set):

If you moved the script to ~/bin, ensure ~/bin is in your PATH. Most modern systems include this by default. If not, edit your shell configuration file (~/.bashrc, ~/.zshrc, or ~/.profile).

Add the following line at the end of the file:

export PATH="$HOME/bin:$PATH"

Save the file and exit.

Reload your shell configuration or open a new terminal session:

source ~/.zshrc # (or ~/.bashrc, ~/.profile depending on your shell)

For Windows (Using Git Bash or WSL)
The easiest way to run shell scripts on Windows is by using Git Bash (included with Git for Windows) or Windows Subsystem for Linux (WSL).

Using Git Bash:
Install Git for Windows: If you don't have it, download and install Git for Windows from https://git-scm.com/download/win. This installation includes Git Bash.

Save the Script:

Save the shell script content as create_project.sh in an easily accessible location, for example, C:\Users\YourUser\Documents.

Open Git Bash: Search for "Git Bash" in your Start Menu and open it.

Give Execute Permissions:

Navigate to the directory where you saved the script. For example:

cd /c/Users/YourUser/Documents

Grant execute permissions:

chmod +x create_project.sh

Move the Script to Git Bash's PATH:

Git Bash has a PATH similar to Linux. The ~/bin directory within Git Bash is typically already in the PATH.

Create the bin directory if it doesn't exist:

mkdir -p ~/bin

Move the script (adjust the Windows path as needed):

mv /c/Users/YourUser/Documents/create_project.sh ~/bin/create_project

Close and reopen Git Bash to ensure the PATH is updated.

Using Windows Subsystem for Linux (WSL):
Install WSL: Follow Microsoft's installation guide for WSL: https://learn.microsoft.com/en-us/windows/wsl/install. You can install a Linux distribution like Ubuntu.

Open WSL Terminal: Search for your installed Linux distribution (e.g., "Ubuntu") in the Start Menu and open it. This will provide a Linux shell environment.

Follow macOS/Linux Steps: From this point, you can follow the exact same steps as for macOS and Linux, as you are now in a Linux environment. Ensure you save the script within the WSL filesystem (e.g., in ~) or access your Windows drives via /mnt/c/.

How to Use the Script
Once the create_project script is set up to be globally executable, you can use it in two ways:

Create a project in the current directory (default behavior):

create_project my-new-application

This will create a new directory my-new-application with the specified structure in the directory where you run the command.

Create a project in a specific directory:

create_project another-application /path/to/your/projects

Replace /path/to/your/projects with the absolute path where you want the new project to be created. For Windows users using Git Bash or WSL, use Linux-style paths (e.g., /c/Users/YourUser/Documents/my_dev_folder).

Example:

If you are in /home/user and run:
create_project my_backend
The project will be created at /home/user/my_backend.

If you run:
create_project my_backend /var/www/html
The project will be created at /var/www/html/my_backend.
