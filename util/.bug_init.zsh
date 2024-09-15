# the following are a subset of conveninene utilities I regularly use
# the are not bash or zsh special

# some variables I used, now that this is a portion of my larger dot config file, 
# use of variables might not necessarily seem necessary, but even in here it is not bad practice
shell_config=$HOME'/.zshrc'
init_config=$HOME'/mnt/util/.bug_init.zsh'

# some python based aliases
alias py='python3'
alias py3='python3'
alias py2='\python'
alias virtualenv='python3 -m venv'
alias serialports='python3 -m serial.tools.list_ports'
alias miniterm='python3 -m serial.tools.miniterm'

#aliases that are for general use
alias edit=nvim
alias sudo='sudo '
alias clc='clear;echo @$HOST;pwd'
alias cls='clear;echo @$HOST;ls'
alias lsl='ls -lh'
alias pong='ping -c 4 google.com'
alias refresh='source $shell_config'
alias bye='exit'
alias quit='exit'
alias editshell='edit $shell_config'
alias editinit='edit $init_config'
alias fudge='rm -rf'
alias fuss='fudge'
alias fussudo='sudo rm -rf'
alias sizeof='du -sh'
alias publicIP='curl ifconfig.co'
alias dog='highlight -O ansi --force'
alias scan_network='sudo nmap -sn 192.168.1.0/24'


# yell out that humble is there
[ -e /opt/ros/humble/setup.zsh ] && printClr 'ros humble ready 2 rumble' 99

getWeather ankara


