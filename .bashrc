# ~/.bashrc
# Exit if not running interactively
[[ $- != *i* ]] && return

## ── Prompt Setup ───────────────────────────────────────────

PS1='  \[\e[3m\]\[\e[90m\]┌──(\[\e[0m\]\[\e[3m\]\[\e[38;2;255;0;53m\]\u@\h\[\e[0m\]\[\e[3m\]\[\e[90m\])-\[\e[0m\]\[\e[90m\][\[\e[0m\]\[\e[3m\]\[\e[38;2;255;0;53m\]\w\[\e[0m\]\[\e[3m\]\[\e[90m\]]\[$(__git_info_prompt)\]\[\e[0m\]\n  \[\e[3m\]\[\e[90m\]└─\[\e[0m\]\[\e[3m\]\[\e[38;2;255;0;53m\]\$\[\e[0m\] '

## ── Aliases ────────────────────────────────────────────────

alias ..='cd ..'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias lsd='eza -Ax --icons'
alias ls='ls -Apx --color=always'
alias lm='ls -alh | more'         # pipe through 'more'
alias ll='ls -alh | less'         # pipe through 'less'
alias lf="ls -p | grep -v /"      # files only
alias ld="ls -d */"               # directories only

alias n='nvim'

alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

alias cls='__print_fetch'

alias bye='sudo shutdown -h now'
alias loop='sudo reboot'

alias fonts='fc-list -f "%{family}\n"'

alias sing='~/.config/hyprscripts/sing.sh'
alias tm='btop'
alias ss='cxxmatrix'

alias gita='git add'
alias gitc='git commit'
alias gits='git status'
alias gitb='git branch'
alias gitf='git fetch'

# Search command line history
alias hs="history | grep "

# alias to cleanup unused docker containers, images, networks, and volumes
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

eval "$(thefuck --alias)"

## ── Custom Functions ───────────────────────────────────────

# Automatically do an ls after each cd, z, or zoxide
cd () {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip () {
    # Internal IP Lookup.
    if command -v ip &> /dev/null; then
        echo -n "Internal IP: "
        ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
    else
        echo -n "Internal IP: "
        ifconfig wlan0 | grep "inet " | awk '{print $2}'
    fi

    # External IP Lookup
    echo -en "External IP: "
    curl -4 ifconfig.me
    echo ""
}

# GitHub Additions
gcom() {
	git add .
	git commit -m "$1"
}
lazyg() {
	git add .
	git commit -m "$1"
	git push
}

__git_info_prompt() {
  # Check if the current directory is inside a Git repository
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Load Git prompt script only once
  if [[ -z "$__GIT_PROMPT_LOADED" ]]; then
    local git_prompt_script="/usr/share/git/completion/git-prompt.sh"
    [[ -f "$git_prompt_script" ]] && source "$git_prompt_script"

    # Configure git prompt state flags
    export GIT_PS1_SHOWDIRTYSTATE=1       # * = unstaged, + = staged
    export GIT_PS1_SHOWSTASHSTATE=1       # $ = stash
    export GIT_PS1_SHOWUNTRACKEDFILES=1   # % = untracked
    export GIT_PS1_SHOWUPSTREAM=auto      # = < > <> based on upstream

    __GIT_PROMPT_LOADED=1
  fi

  # Capture current branch name using __git_ps1 and display it
  local branch
  branch=$(__git_ps1 "%s")
  printf '\e[90m-{'
  printf '\e[0m\e[97m%s' "$branch"
  printf '\e[0m\e[90m}'
}

__print_fetch() {
  kitten icat \
    --align left \
    --place 35x35@5x2 \
    ~/.config/fastfetch/logo/logo-0.gif | \
    fastfetch \
    --raw - \
    --logo-width 38
}

## ── Custom Paths ───────────────────────────────────────────

export PATH="$PATH:$HOME/.spicetify"

## ── Startup Commands ───────────────────────────────────────

#[[ "$PWD" == "$HOME" ]] && __print_fetch
