#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias cls='clear && fastfetch'
alias lsd='eza --icons'
alias pool='clear && asciiquarium'
alias bye='sudo shutdown -h now'
alias loop='sudo reboot'
alias fonts='fc-list -f "%{family}\n"'
alias n='nvim'
alias sing='~/.config/scripts/./sing.sh'
PS1='[\u@\h \W]\$ '

fastfetch
