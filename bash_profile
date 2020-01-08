# Set shell prompt
#export PS1='\u@\h:\w > '
export PS1='$PWD > '

# Set aliases
alias ls='gls -lhF --group-directories-first --color=auto'
alias la='gls -lahF --group-directories-first --color=auto'
alias gg='cd ~/documents/github'
alias python='python3'
alias nano='/usr/local/bin/nano'
alias log='screen /dev/tty.usbserial-FTWHFLU9D 115200'

# Set ls colors
# See http://linux-sxs.org/housekeeping/lscolors.html
# NOTE Using gls
# 
# directories: plain cyan
# aliases: plain yellow
# executable: plain purple
LS_COLORS=$LS_COLORS:'di=0;36:ln=0;93:ex=0;35:' ; export LS_COLORS

# Set git directory
export GIT="$HOME/Documents/GitHub"
export SCRIPTS="$GIT/scripts"
export PATH="$PATH:$SCRIPTS"

# Set python module directory
export PYTHONPATH="$GIT/modules"

# Homebrew...
export PATH="/usr/local/sbin:$PATH"

# Reveal Shell in use
echo "Running Shell from $SHELL"
