#!/usr/bin/bash


# Display Welcome Message
echo ""
echo "Welcome to HistManagerBETA Installer"
echo "===================================="
echo "checking if python3 is installed on this system"

# Systems Check
if $(python3 -V | grep -q 'Python 3'); then # if python3 version command runs successfully -> python3 must be installed
    sleep 1
    echo "[python3 functional]"
    sleep 0.5
    echo ""
else # Quit if python3 unavailable
    echo ""
    sleep 1
    echo "Python3 is not installed on this system."
    sleep 1
    echo "Please install python3, and then re-run the HistManager installer."
    sleep 1
    echo "===============ERROR================"
    echo "Quitting Installer."
    exit 1
fi

# Confirm Install
while true; do
    read -p "Do you wish to install HistManagerBETA? (y/n)        " yn
    case $yn in
        [Yy]* ) echo ""; break;;
        [Nn]* ) echo ""; echo "Quiting HistManagerBETA installer."; exit;;
        * ) echo "  invalid input";; #"Do you wish to install HistManagerBETA?(y/n)        ";;
    esac
done

# Stage is Set, Begin!
echo "Installing HistManagerBETA - report any errors to histmanager@gmail.com"
sleep 1
echo ""

#Backup .bashrc, if it exists
if [ -f "~/.bashrc" ]
then
    cp ~/.bashrc ~/bashrc_backup.txt
    {
        sleep 0.25
        printf "%s" "Creating backup of .bashrc file"
        sleep 0.2
        printf "%s" " ."
        sleep 0.2
        printf "%s" "."
        sleep 0.2
        printf "%s" "."
        sleep 0.25
        printf "%s" ". "
        sleep 0.25
        echo "[Done]"
        sleep 1
    } # Fancy Display!
fi

# Backup Existing History, if any
if [ -f "~/.bash_history" ] # create .bash_history file if it doesn't exist (needed for import into Master.khtxt)
then
    sleep 0.1
else
    touch ~/.bash_history
fi
cp ~/.bash_history ~/BashHistoryBackup_20$(date +%y-%m-%d_%H':'%M':'%S).txt
{
    sleep 0.5
    printf "%s" "Creating backup of Terminal History"
    # as on $(date +%y-%m-%d)" #Shortened display
    sleep 0.5
    printf "%s" " ."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" ". "
    sleep 0.5
    echo "[Done]"
    sleep 0.5
} # Fancy Display!

# Create the .khist Folder, and some of the Magic that goes Inside Too
mkdir ~/.khist
echo "{}" > ~/.khist/environments.khtxt # Create a file to store all the environment data
touch ~/.khist/currentenv.khtxt # Create a file to remember the terminal environment from each session
touch ~/.khist/errorlog.khtxt # Create a file to log any errors that may occur
echo "HistManagerBETA 1.0 ErrorLog" > ~/.khist/errorlog.khtxt
{
    sleep 0.5
    printf "%s" "Creating the 'khist' Directory" 
    #hidden folder in your home directory, where your history will now reside"
    sleep 0.5
    printf "%s" " ."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" ". "
    sleep 0.5
    echo "[Done]"
    sleep 0.5
} # Fancy Display!

# Import any existing History into the HistManager
mkdir ~/.khist/history
cp ~/.bash_history ~/.khist/history/Master.khtxt
{
    echo "Master"
    echo $(wc -l < ~/.bash_history)
} > ~/.khist/currentenv.khtxt # By default, the environment before histmanager was installed is assumed to have been 'Master'
{
    sleep 0.5
    printf "%s" "Initialising the 'Master' History Environment" 
    #, which will contain all your Terminal history, from all other environments."
    sleep 0.5
    printf "%s" " ."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" ". "
    sleep 0.5
    echo "[Done]"
    sleep 0.5
} # Fancy Display!

# Clean Up
mv ~/histmanager-code-remover ~/.khist/HistManager-Uninstall.py
mv ~/shistmanager-code-remover ~/.khist/shistmanager-code-remover.sh # unnecessary, but looks cool if all the files disappear together
mv ~/histmanager-code ~/.khist/HistManager.py
mv ~/install-histmanager.sh ~/.khist/installfile_archived.sh # Might as well be omited
{
    sleep 1
    printf "%s" "Deleting Installer Files"
    sleep 0.5
    printf "%s" " ."
    sleep 0.5
    printf "%s" "."
    sleep 0.5
    printf "%s" "."
    sleep 1
    printf "%s" ". "
    sleep 0.5
    echo "[Done]"
    sleep 0.5
} # Fancy Display!

# Set Up Uninstallation Tools
mv ~/.khist/shistmanager-code-remover.sh ~/uninstall-histmanager.sh # bring the file back from hiding, with a different name - looks new!
{
    sleep 1
    printf "%s" "Setting up Uninstallation Tools"
    sleep 0.5
    printf "%s" " ."
    sleep 1
    printf "%s" "."
    sleep 1.5
    printf "%s" "."
    sleep 1
    printf "%s" ". "
    sleep 0.5
    echo "[Done]"
    sleep 0.5
} # Fancy Display!

# Configure Terminal Startup
welmes="HistManagerBETA 1.0 running."
{
    {
        echo "printf 'W'"
        #echo "sleep 0.5"
        echo "printf 'e'"
        #echo "sleep 0.5"
        echo "printf 'l'"
        #echo "sleep 0.5"
        echo "printf 'c'"
        #echo "sleep 0.5"
        echo "printf 'o'"
        #echo "sleep 0.5"
        echo "printf 'm'"
        #echo "sleep 0.5"
        echo "printf 'e'"
        #echo "sleep 0.5"
        echo "echo '.'"
        #echo "sleep 0.5"
    } # Fancy Display, for HistManager.sh - upon every startup!
    echo "echo $welmes"
    echo "echo ------------------------------------"
    echo "echo  "
    echo "python3 ~/.khist/HistManager.py"
    echo "echo  "
    echo "echo ------------------------------------"
    echo "sleep 1.1"
    echo "clear"
    echo ""
    echo "# HistManager - Effectively Manage Terminal History"
    echo "# Copyright (C) 2016  Kaivalya Rawal (histmanager@gmail.com)"
    echo "# You should have received a copy of the GNU Affero General Public License"
    echo "# along with this program.  If not, see <http://www.gnu.org/licenses/>."
} > ~/.khist/histmanager.sh
echo "sh ~/.khist/histmanager.sh # Added by HistManager" >> ~/.bashrc
{
    sleep 0.5
    printf "%s" "Configuring Terminal Startup to use HistManagerBETA"
    sleep 0.5
    printf "%s" " ."
    sleep 1
    printf "%s" "."
    sleep 1
    printf "%s" "."
    sleep 1
    printf "%s" ". "
    sleep 0.5
    echo "[Done]"
    sleep 0.5
} # Fancy Display!

# Say your Goodbyes!
sleep 3
echo ""
sleep 1
echo "Please restart the Terminal to start using HistManager."
echo ""
sleep 1

exit

#   HistManager - Effectively Manage Terminal History
#   Copyright (C) 2016  Kaivalya Rawal (histmanager@gmail.com)
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Affero General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or 
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU Affero General Public License for more details.

#   You should have received a copy of the GNU Affero General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
