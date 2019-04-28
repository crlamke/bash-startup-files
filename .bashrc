# .bashrc
#set -x

# Set path to optional config files that add functionality 
# to this script.
cfgPath="/home/chris/dev/bash/bash-startup-files/"

# Set version of this set of startup files
bashrcVersion=0.75


# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Check whether there's a new version of .bashrc available
if [ -f ${cfgPath}/bashrc-version.cfg ]; then
  IFS='.' read majorVersion minorVersion  < ${cfgPath}/bashrc-version.cfg
  IFS='.' read thisMajorVersion thisMinorVersion <<< "$bashrcVersion"
  newVersionAvailable=0
  if [ "$majorVersion" -gt "$thisMajorVersion" ]; then
    newVersionAvailable=1
  else
    if [ "$minorVersion" -gt "$thisMinorVersion" ]; then
      newVersionAvailable=1
    fi
  fi
else
  echo "bashrc version file not found. Unable to check for new version."
fi

# If there's a new version of .bashrc available, 
# then tell the user and create an update script.
if [ $newVersionAvailable -eq 1 ]; then
  echo "There's a new version of .bashrc available. To update, run update-bashrc.sh"
  printf "%s\n%s" '#!/bin/bash' "mv ./.bashrc ./.bashrc.bak; cp ${cfgPath}/.bashrc ." > ./update-bashrc.sh
  chmod +x ./update-bashrc.sh
fi

# Set up aliases
# Source alias file if it exists. If not, just set a few default aliases
if [ -f ${cfgPath}/bash-alias.cfg ]; then
  . ${cfgPath}/bash-alias.cfg
else
  echo "bash aliases file not found. Setting a few default aliases."
  alias new="ls -larth"
  alias old="ls -lath"
fi

# Set up functions
# Source function file if it exists.
if [ -f ${cfgPath}/bash-func.cfg ]; then
  . ${cfgPath}/bash-func.cfg
else
  echo "bash functions file not found."
fi

# Set up prompts
# Source prompts file if it exists.
if [ -f ${cfgPath}/bash-prompt.cfg ]; then
  . ${cfgPath}/bash-prompt.cfg
else
  echo "bash prompts file not found. Setting default prompt"
  #Simple PS1 prompt with some color
  PS1="\[\e[36;1m\]\h:\[\e[32;1m\]\w$ \[\e[0m\]"
fi


#
# Set history config
#
export HISTTIMEFORMAT='%F %T: '
# export HISTCONTROL=ignoredups // Uncomment to have history ignore duplicates

#
# Set paths, which are likely to vary more between machines
#

# Uncomment the following line if you don't like systemctl's auto-paging feature
# export SYSTEMD_PAGER=

export JAVA_HOME=/usr

export EDITOR="/usr/bin/vim"



