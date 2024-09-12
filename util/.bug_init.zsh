

shell_config=$HOME'/.zshrc'
init_config=$HOME'/mnt/util/.bug_init.zsh'

alias py='python3'
alias py3='python3'
alias py2='\python'
alias virtualenv='python3 -m venv'
alias serialports='python3 -m serial.tools.list_ports'
alias miniterm='python3 -m serial.tools.miniterm'

#aliases
#commands
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

source ~/mnt/util/.oh/zsh-vim-mode.plugin.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#009999"
bindkey "  " autosuggest-accept

source /opt/ros/humble/setup.zsh
[ -e /opt/ros/humble/setup.zsh ] && source /opt/ros/humble/setup.zsh && printClr 'ros humble HAZIR' 99

getWeather ankara


