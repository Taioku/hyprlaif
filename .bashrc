# ~/.bashrc
# Exit if not running interactively
[[ $- != *i* ]] && return

## ── Prompt Setup ───────────────────────────────────────────

PS1='  \[\e[3m\]\[\e[90m\]┌──(\[\e[0m\]\[\e[3m\]\u@\h\[\e[0m\]\[\e[90m\])-\[\e[0m\]\[\e[90m\][\[\e[0m\]\[\e[3m\]\w\[\e[0m\]\[\e[90m\]]\[$(__git_info_prompt)\]\[\e[0m\]\n  \[\e[3m\]\[\e[90m\]└─\[\e[0m\]\[\e[3m\]\$\[\e[0m\] '

## ── Aliases ────────────────────────────────────────────────

alias cls='__print_fetch'
alias lsd='eza --icons'
alias bye='sudo shutdown -h now'
alias loop='sudo reboot'
alias fonts='fc-list -f "%{family}\n"'
alias n='nvim'
alias sing='~/.config/hyprscripts/sing.sh'
alias tm='btop'
alias ss='cxxmatrix'

alias gita='git add'
alias gitc='git commit'
alias gits='git status'
alias gitb='git branch'
alias gitf='git fetch'

eval "$(thefuck --alias)"

## ── Custom Functions ───────────────────────────────────────

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
