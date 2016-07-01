HistManager
=================================

A tool to manage terminal history for Bash based Linux environments.

# Synopsis

## Motivation
The default history management system of the terminal can sometimes seem clunky and unhelpful. While the terminal is versatile and facilitates a wide variety of tasks, the terminal command history can only be accessed as a single obscenely-long list. When using the terminal, this often makes it difficult to scroll to the desired commands, especially for novice users.

## Objective
This project aims to simplify that task, by splitting each use of the terminal into a _session_, with an _environment_. The user can select the environment of the terminal upon startup, and thus obtain clutter free access to all the commands executed in that particular environment, with other environments' history not in the picture. For example, when working on a Java Applet, the user may choose to use a Java environment, which would provide only the Java environments' terminal history - and not show any Python commands that were executed from the Python environment.

## Strategy
The history of the bash terminal, by default, is stored in the ~/`.bash_history` file. HistManager works by constantly editing this file - replacing it with a different file (based on the environment history the user wants to import). This way, the system still uses the default, `.bash_history` file to both add and retrieve commands, but the file iself is managed by HistManager - thus changing the history on demand. Additions to environment histories also occur this way - the system edits the `.bash_history` file, and the edits are copied into the relevant environment history file by HistManager.

Apart from all the user generated environments, there is another, 'Master' environment - which can't be edited by the user. This environment is special, as it contains all the history, from all the environments. Thus, selecting the Master environment for a Terminal session has the same effect as continuing with the default `.bash_history` file.

## Pizzazz
Apart from just replacing the `.bash_history` file appropriately, HistManager provides some more features.

### The HistManager Settings Menu
Enabling the user to create new environments is the only necessary feature required for HistManager to function. However, HistManager goes beyond this and allows renaming, merging and archiving existing environments. These features can be accessed from the `HistManager Settings` menu.

### Quirks and Hacks
Here is a list of other quirks in the program. These aren't listed anywhere else, as they are not essential to the core functionality offered by the code.

* Environment Names
  * All environment names are case insensitive. Thus, _jAvA_ and _java_ are identical to _Java_.
  * Environment names can't contain special characters or whitespace, but the `+`, `-`, and `_` symbols are still allowed in environment names.
  * An environment can't be named _Master_ or _HistManager-Settings_.
  * Environment names cant contain the words _archive_, or _Error-Env_, or _Pre-Merge_.
* Menus
  * The `(y/n)` menu is case insensitive; and considers `Y`, `y`, `Yes`, and `yes` to be identical; and `N`, `n`, `No`, and `no` to be identical.
  * When choosing environments from a list, typing environment names functions the same as typing their serial numbers.
  * Pressing _Enter_ (or _Return_) when accessing any of the settings features, such as _rename_ or _merge_, returns to the _HistManager Settings_ menu.
  * Pressing _Enter_ (or _Return_) when accessing the _HistManager Settings_ menu returns to the _Environment Menu_ .
  * Pressing _Enter_ (or _Return_) at the _Environment Menu_ loads the environment from the previous session of the Terminal, if any.
  * When at the _Environment Menu_, the decimal numbers `0.1` through `0.7` offer direct access to the first through the seventh options from the _HistManager Settings_ menu, respectively. All other 0.x decimals open up the _HistManager Settings_ menu.
  * When selecting a display mode for viewing environment history, negative menu options can be used too, to sort the output alphabetically, rather than chronologically.
* Merging Environments
  * When two environments are merged, their individual histories are first archived, and can thus be retrieved.

# Set Up

## Installation
The installation module of this project is a work in progress. For now, follow the following steps to install:
 1. Download and move these files into your home directory:
    * `install-histmanager.sh` (the installation Shell Script)
    * `histmanager-code` (the Python3 HistManager code)
    * `histmanager-code-remover` (the Python3 HistManager uninstall code)
    * `shistmanager-code-remover` (the uninstallation Shell Script)
 2. Close any existing Terminal windows, and open a new window.
 3. Type `sh install-histmanager.sh`
 4. Move the `BashHistoryBackup_yyyy-mm-dd_hh-mm-ss.txt` file created in your home directory to an appropriate location.
 4. Move the `uninstall-histmanager.sh` file created in your home directory to an appropriate location. **Do not delete this file**.
 5. Restart the Terminal to check installation and begin using HistManager.

##Uninstallation
The uninstallation module of this project is also a work in progress. For now, follow the following steps to uninstall:
 1. Move the `uninstall-histmanager.sh` file created at installation time back into your home directory.
 2. Open the Terminal, and select the _Master_ environment, if possible.
 3. Type `sh uninstall-histmanager.sh`
 4. Restart the Terminal to check if uninstallation was successful.

# Documentation

This project is still not documented completely. Please use the source files for now.

# Samples

## Installation
Installing HistManager, after moving the relevant files into home directory:
```sh
... ~ $ sh install-histmanager.sh 

Welcome to HistManagerBETA Installer
====================================
checking if python3 is installed on this system
[python3 functional]

Do you wish to install HistManagerBETA? (y/n)        y

Installing HistManagerBETA - report any errors to histmanager@gmail.com

Creating backup of Terminal History .... [Done]
Creating the 'khist' Directory .... [Done]
Initialising the 'Master' History Environment .... [Done]
Deleting Installer Files .... [Done]
Setting up Uninstallation Tools .... [Done]
Configuring Terminal Startup to use HistManagerBETA .... [Done]

Please restart the Terminal to start using HistManager.

... ~ $ 
```

## First Run - Creating Some Environments
Creating two environments:
1. SudoInstalls - for doing all installation related work, will contain multiple `sudo apt-get` commands
2. CS101 - for doing all work related to college course CS101, will probably be a software project
And then initialising the terminal session as a 'CS101' environment
```sh
Welcome.
HistManagerBETA 1.0 running.
------------------------------------

Importing all previous History to the Master Environment

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
Enter choice: 0

[HistManager Settings] Choose an option:
	1) Set up a new environment
	2) Rename an environment
	3) Merge two environments
	4) Archive an environment
	5) View all archived environments
	6) Restore an archived environment
	7) View environment history
	8) Leave settings and go back to environment menu
Enter choice: 1
[Creating New Environment]
	Enter the name of the new environment: SudoInstalls
Environment 'SudoInstalls' created successfully, returning to environment menu

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) SudoInstalls
Enter choice: 0

[HistManager Settings] Choose an option:
	1) Set up a new environment
	2) Rename an environment
	3) Merge two environments
	4) Archive an environment
	5) View all archived environments
	6) Restore an archived environment
	7) View environment history
	8) Leave settings and go back to environment menu
Enter choice: 1
[Creating New Environment]
	Enter the name of the new environment: CS101
Environment 'CS101' created successfully, returning to environment menu

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CS101
	3) SudoInstalls
Enter choice: 2

CS101 history sucessfully imported.

------------------------------------

 ~ $ mkdir CS101
 ~ $ cd CS101
 ~/CS101 $ git init
Initialized empty Git repository in /home/user/CS101/.git/
 ~/CS101 $ 
```

## Second Run - Using HistManager
Switching to the 'Master' in the next terminal session
```sh
Welcome.
HistManagerBETA 1.0 running.
------------------------------------

Updating Master Environment.
Exporting CS101 history from previous session.

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CS101
	3) SudoInstalls
Enter choice: 1

Master history sucessfully imported.

------------------------------------

 ~ $ pwd
/home/user
```

## Third Run - Renaming and Archiving Environments
Renaming 'CS101' to 'CompSci101', archiving 'SudoInstalls', and then initialising the terminal session as a 'CompSci101' session
```sh
Welcome.
HistManagerBETA 1.0 running.
------------------------------------

Exporting Master history from previous session.

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CS101
	3) SudoInstalls
Enter choice: 0

[HistManager Settings] Choose an option:
	1) Set up a new environment
	2) Rename an environment
	3) Merge two environments
	4) Archive an environment
	5) View all archived environments
	6) Restore an archived environment
	7) View environment history
	8) Leave settings and go back to environment menu
Enter choice: 2
[Renaming Environment]
	Enter the current environment name: CS101
	Enter the new name for the environment: CompSci101
Environment 'CS101' successfully renamed to 'CompSci101', returning to environment menu

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CompSci101
	3) SudoInstalls
Enter choice: 0

[HistManager Settings] Choose an option:
	1) Set up a new environment
	2) Rename an environment
	3) Merge two environments
	4) Archive an environment
	5) View all archived environments
	6) Restore an archived environment
	7) View environment history
	8) Leave settings and go back to environment menu
Enter choice: 4
[Archiving Environment]
Enter the environment you wish to archive: SudoInstalls
Environment 'SudoInstalls' successfully archived, returning to environment menu

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CompSci101
Enter choice: 2

CompSci101 history sucessfully imported.

------------------------------------

 ~ $ mv ~/CS101/ ~/CompSci101
 ~ $ cd CompSci101/
 ~/CompSci101 $ 
```

## Fourth Run - Restoring Environments
Restoring the archived SudoInstalls environment, setting it as the environment for the terminal session
```sh
Welcome.
HistManagerBETA 1.0 running.
------------------------------------

Updating Master Environment.
Exporting CompSci101 history from previous session.

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CompSci101
Enter choice: 0

[HistManager Settings] Choose an option:
	1) Set up a new environment
	2) Rename an environment
	3) Merge two environments
	4) Archive an environment
	5) View all archived environments
	6) Restore an archived environment
	7) View environment history
	8) Leave settings and go back to environment menu
Enter choice: 6
[Restoring Archived Environment]
Select the environment you wish to resore: 
	1) SudoInstalls
	2) Return to settings menu
Enter choice: 1
Environment 'SudoInstalls' successfully restored, returning to environment menu

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CompSci101
	3) SudoInstalls
Enter choice: 3

SudoInstalls history sucessfully imported.

------------------------------------

 ~ $ sudo apt-get
[sudo] password for user: 
apt 1.0.1ubuntu2 for amd64 compiled on May 18 2016 09:49:01
Usage: apt-get [options] command
       apt-get [options] install|remove pkg1 [pkg2 ...]
       apt-get [options] source pkg1 [pkg2 ...]

apt-get is a simple command line interface for downloading and
installing packages. The most frequently used commands are update
and install.

Commands:
   update - Retrieve new lists of packages
   upgrade - Perform an upgrade
   install - Install new packages (pkg is libc6 not libc6.deb)
   remove - Remove packages
   autoremove - Remove automatically all unused packages
   purge - Remove packages and config files
   source - Download source archives
   build-dep - Configure build-dependencies for source packages
   dist-upgrade - Distribution upgrade, see apt-get(8)
   dselect-upgrade - Follow dselect selections
   clean - Erase downloaded archive files
   autoclean - Erase old downloaded archive files
   check - Verify that there are no broken dependencies
   changelog - Download and display the changelog for the given package
   download - Download the binary package into the current directory

Options:
  -h  This help text.
  -q  Loggable output - no progress indicator
  -qq No output except for errors
  -d  Download only - do NOT install or unpack archives
  -s  No-act. Perform ordering simulation
  -y  Assume Yes to all queries and do not prompt
  -f  Attempt to correct a system with broken dependencies in place
  -m  Attempt to continue if archives are unlocatable
  -u  Show a list of upgraded packages as well
  -b  Build the source package after fetching it
  -V  Show verbose version numbers
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
See the apt-get(8), sources.list(5) and apt.conf(5) manual
pages for more information and options.
                       This APT has Super Cow Powers.
 ~ $ 
```

## Uninstallation
Uninstalling HistManager, after moving the relevant file into the home directory
```sh
Welcome.
HistManagerBETA 1.0 running.
------------------------------------

Updating Master Environment.
Exporting SudoInstalls history from previous session.

[Environment Menu] Select an environment for this session:
(or enter '0' or '1' to go to HistManager-Settings or Master, respectively)
	0) HistManager-Settings
	1) Master
	2) CompSci101
	3) SudoInstalls
Enter choice: 1

Master history sucessfully imported.

------------------------------------

 ~ $ sh uninstall-histmanager.sh 

Do you wish to uninstall HistManagerBETA?(y/n)       y

Uninstalling HistManagerBETA

Removing HistManagerBETA from Terminal Startup Config .... [Done]
Creating backup of Terminal History .... [Done]
Restoring original History Settings .... [Done]
Deleting HistManagerBETA Data and Programs .... [Done]

Successfully Uninstalled HistManagerBETA
Please restart the Terminal.

 ~ $ 
```


# Contact and More

HistManagerBETA was released on July 1, 2016. If you have any questions, wish to report bugs, or to contribute to this project, simply write to [histmanager@gmail.com](mailto:histmanager@gmail.com) (yes, emails shall be responded to promptly).

# License

## Authors Note
This is an Open-Source project. Contributions are welcome (I could use the help!). You are free to use this project (modified or otherwise) whichever way you please - as long as you continue to keep it free.

## More Info (aka Law Speak)
This project is released under the [GNU-AGPL](https://www.gnu.org/licenses/agpl-3.0.txt) license.

This means that your permissions are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. When a modified version is used to provide a service over a network, the complete source code of the modified version must be made available.

Please read the LICENSE.md(https://raw.githubusercontent.com/kaivalyar/HistManager/master/LICENSE.md) file or visit [www.gnu.org/licenses/agpl-3.0.txt](https://www.gnu.org/licenses/agpl-3.0.txt) for even**(!)** more information.
