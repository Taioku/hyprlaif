# ~/.bashrc
# Exit if not running interactively
[[ $- != *i* ]] && return

## ── Git Prompt Setup ───────────────────────────────────────

# Load Git prompt support
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  source /usr/share/git/completion/git-prompt.sh
fi

# Git prompt state flags
export GIT_PS1_SHOWDIRTYSTATE=1       # * = unstaged, + = staged
export GIT_PS1_SHOWSTASHSTATE=1       # $ = stash
export GIT_PS1_SHOWUNTRACKEDFILES=1   # % = untracked
export GIT_PS1_SHOWUPSTREAM=auto      # = < > <> based on upstream

# Set custom prompt
PS1='\[\e[3m\]\u@\h\[\e[0m\] \[\e[1;31m\]\w\[\e[0m\]$(__git_ps1 " \[\e[97m\]%s\[\e[0m\]")\n  \[\e[97m\]\$\[\e[0m\] '

## ── Aliases ────────────────────────────────────────────────

alias cls='print-fetch'
alias lsd='eza --icons'
alias bye='sudo shutdown -h now'
alias loop='sudo reboot'
alias fonts='fc-list -f "%{family}\n"'
alias n='nvim'
alias sing='~/.config/scripts/sing.sh'
alias tm='btop'
alias ss='cxxmatrix'

## ── Custom Functions ───────────────────────────────────────

print-fetch() {
  if [[ "$PWD" == "$HOME" ]]; then
    kitten icat \
      --align left \
      --place 34x35@5x2 \
      ~/.config/fastfetch/logo/logo-0.gif | \
    fastfetch \
      --raw - \
      --logo-width 38
  fi
}

## ── Custom Paths ───────────────────────────────────────────

export PATH="$PATH:/home/taioku/.spicetify"

## ── Startup Commands ───────────────────────────────────────

cls
