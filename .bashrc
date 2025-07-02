# ~/.bashrc

## ── Early Exit ──────────────────────────────────────────────
# Exit immediately if the shell is not interactive
[[ $- != *i* ]] && return

## ── Fastfetch ───────────────────────────────────────────────
# Display system info if 'fastfetch' is installed
if [[ $(tty) != /dev/tty* ]]; then
  if [ -x /usr/bin/fastfetch ]; then
    fastfetch
  fi
fi

## ── History Configuration ───────────────────────────────────
# Avoid duplicate entries and ignore commands starting with space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Append to history file, don't overwrite it
shopt -s histappend

# Write to history after every command
PROMPT_COMMAND='history -a'

## ── Editors ─────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim

## ── LS_COLORS ───────────────────────────────────────────────
# Customize colors for 'ls'
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

## ── Prompt ──────────────────────────────────────────────────
# Custom PS1 prompt with Git info
PS1='  \[\e[3m\]\[\e[90m\]┌──(\[\e[0m\]\[\e[3m\]\[\e[38;2;255;0;53m\]\u@\h\[\e[0m\]\[\e[3m\]\[\e[90m\])-[\[\e[0m\]\[\e[3m\]\[\e[38;2;255;0;53m\]\w\[\e[0m\]\[\e[3m\]\[\e[90m\]]$(__git_info_prompt)\n  \[\e[3m\]\[\e[90m\]└─\[\e[0m\]\[\e[3m\]\[\e[38;2;255;0;53m\]\$\[\e[0m\] '

## ── Aliases ─────────────────────────────────────────────────

# Navigation
alias ..='cd ..'

# Safe file operations
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# Listing
alias lsd='eza -Ax --icons'
alias ls='ls -Apx --color=always'
alias lm='ls -alh | more'
alias ll='ls -alh | less'
alias lf="ls -p | grep -v /" # files only
alias ld="ls -d */"          # dirs only

# Editors
alias n='nvim'
alias vi='nvim'
alias vim='nvim'

# Search
alias grep='grep --color=always'

# Package helper
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# Misc
alias c='clear'
alias bye='sudo shutdown -h now'
alias loop='sudo reboot'
alias fonts='fc-list -f "%{family}\n"'
alias sing='~/.config/hyprscripts/sing.sh'
alias tm='btop'
alias ss='cxxmatrix'

# Git shortcuts
alias gita='git add'
alias gitc='git commit'
alias gits='git status'
alias gitb='git branch'
alias gitf='git fetch'

# Search history
alias hs="history | grep "

# Docker cleanup
alias docker-clean='
  docker container prune -f &&
  docker image prune -f &&
  docker network prune -f &&
  docker volume prune -f'

# The Fuck
eval "$(thefuck --alias)"

## ── Functions ──────────────────────────────────────────────

# Show Git branch info in prompt
__git_info_prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  if [[ -z "$__GIT_PROMPT_LOADED" ]]; then
    for script in \
      /usr/share/git/completion/git-prompt.sh \
      /etc/bash_completion.d/git-prompt \
      "$HOME/.local/share/git-prompt.sh"; do
      [[ -f "$script" ]] && source "$script" && break
    done
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM=auto
    __GIT_PROMPT_LOADED=1
  fi

  local branch=$(__git_ps1 "%s")
  printf '\e[90m-{'
  printf '\e[97m%s' "$branch"
  printf '\e[90m}'
}

# Override 'cd' to use 'z'
cd() {
  if [ $# -eq 0 ]; then
    builtin cd ~
  else
    z "$@"
    ls
  fi
}

# IP lookup portable
alias whatismyip="whatsmyip"
whatsmyip() {
  echo -n "Internal IP: "
  if command -v ip &>/dev/null; then
    ip addr show | awk '/inet / && $2 !~ /^127/ {print $2}' | cut -d/ -f1 | head -n1
  elif command -v ifconfig &>/dev/null; then
    ifconfig | awk '/inet / && $2 != "127.0.0.1" {print $2}' | head -n1
  else
    echo "unknown"
  fi

  echo -n " | External IP: "
  command -v curl &>/dev/null && curl -s -4 ifconfig.me || echo "unknown"
  echo
}

# Git add+commit
gcom() { git add . && git commit -m "$1"; }
lazyg() { git add . && git commit -m "$1" && git push; }

# Prettyfetch using kitten icat and fastfetch
prettyfetch() {
  kitten icat \
    --align left \
    --place 35x35@5x2 \
    ~/.config/fastfetch/logo/logo-0.gif |
    fastfetch --raw - --logo-width 38
}

## ── Startup Bindings ───────────────────────────────────────
# Ctrl-F runs zoxide interactive mode
bind '"\C-f":"cdi\n"'

# Initialize zoxide (smarter cd)
eval "$(zoxide init --cmd cd bash)"
