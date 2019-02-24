# .bashrc
#set -x

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Set path to optional config files that add functionality 
# to this script.
cfgPath="/home/chris/dev/bash/bash-scripts/"

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



