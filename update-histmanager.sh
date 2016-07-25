#!/usr/bin/bash


# Display Welcome Message
echo ""
echo "Welcome to HistManagerBETA Updater"
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
    echo "Please install python3, and then re-run the HistManager updater."
    sleep 1
    echo "===============ERROR================"
    echo "Quitting Installer."
    exit 1
fi

# Confirm Update
while true; do
    read -p "Do you wish to update HistManagerBETA? (y/n)        " yn
    case $yn in
        [Yy]* ) echo ""; break;;
        [Nn]* ) echo ""; echo "Quiting HistManagerBETA installer."; exit;;
        * ) echo "  invalid input";; #"Do you wish to install HistManagerBETA?(y/n)        ";;
    esac
done

# Stage is Set, Begin!
echo "Updating HistManagerBETA - report any errors to histmanager@gmail.com"
sleep 1
echo ""

cp ~/.bash_history ~/MasterHistoryBackup_20$(date +%y-%m-%d_%H':'%M':'%S).txt
{
    sleep 0.5
    printf "%s" "Creating backup of Master History"
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

echo '{"underline": "\u001b[4m", "hmagenta": "\u001b[45m", "bhcyan": "\u001b[106m", "magenta": "\u001b[35m", "hgreen": "\u001b[42m", "bhyellow": "\u001b[103m", "bwhite": "\u001b[97m", "bhgreen": "\u001b[102m", "blue": "\u001b[34m", "hwhite": "\u001b[47m", "bgreen": "\u001b[92m", "byellow": "\u001b[93m", "bcyan": "\u001b[96m", "hcyan": "\u001b[46m", "black": "\u001b[30m", "bold": "\u001b[1m", "bhblue": "\u001b[104m", "white": "\u001b[37m", "yellow": "\u001b[33m", "bmagenta": "\u001b[95m", "PFORMAT": "", "bhblack": "\u001b[100m", "hred": "\u001b[41m", "hblue": "\u001b[44m", "hyellow": "\u001b[43m", "bblack": "\u001b[90m", "bhmagenta": "\u001b[105m", "bhwhite": "\u001b[107m", "normal": "\u001b[0m", "EMPHASIS": "\u001b[1m", "red": "\u001b[31m", "hblack": "\u001b[40m", "cyan": "\u001b[36m", "INFORMAT": "\u001b[33m", "bred": "\u001b[91m", "COMMENTARY": "\u001b[34m", "bhred": "\u001b[101m", "green": "\u001b[32m", "bblue": "\u001b[94m", "ERRFORMAT": "\u001b[31m"}' > ~/.khist/styles.hmconfig
{
    sleep 0.5
    printf "%s" "Updating the 'khist' Directory" 
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
}

echo "\nHistManagerBETA 2.0(update) ErrorLog\n" >> ~/.khist/errorlog.khtxt
mv ~/histmanager-code ~/.khist/HistManager.py
{
    sleep 1
    printf "%s" "Updating HistManager to version 2.0"
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
}

mv ~/update-histmanager.sh ~/.khist/updatefile2.0_archived.sh
{
    sleep 1
    printf "%s" "Deleting Updater Files"
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
}

# ReConfigure Terminal Startup
welmes="HistManagerBETA 2.0 running."
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

# Say your Goodbyes!
sleep 3
echo ""
sleep 1
echo "Updation successful, please restart the terminal to start using HistManagerBETA 2.0"
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

