# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#TERM=xterm-256color

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -f ~/.zsh_my_env ]; then
    . ~/.zsh_my_env
fi

#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="terminalparty"
ZSH_THEME="jreese"

DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git debian systemd sudo history man z) 


# User configuration


export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Automatically list directory contents on `cd`.
# psuje workon 
# auto-ls () { ls --color; }
# chpwd_functions=( auto-ls $chpwd_functions )

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=50
export SAVEHIST=0

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# export EDITOR=e

alias zshrc="$EDITOR ~/.zshrc"
alias zshh="$EDITOR ~/.zsh_history"
alias dl='dpkg -l | less -S'
alias acsh='apt-cache show'
alias ach='apt changelog'
alias jf='journalctl -f -n20'
alias jc='journalctl --since today'
alias uq='systemctl list-units | grep $1'
alias lf='systemctl list-units --state=failed'
alias ss='sudo ss -ltunp'
alias cls="echo -ne '\033c'" # urxvt terminal clean buffer
alias ahu="apt-history upgrade"

# alias ohmyzsh="mate ~/.oh-my-zsh"

function dq () {
    dpkg-query -W \
               -f='${db:Status-Abbrev}${binary:Package} '"$fg[blue]"'(${Version})'"$reset_color"'\n' \
        | grep -i --colour=never $1
}

function ipaddr () { echo; ip -c a; zle redisplay }
zle -N ipaddr
bindkey "^[k" ipaddr

if [ -x /usr/bin/direnv ]; then
    eval "$(direnv hook zsh)"
fi

unsetopt share_history
setopt completealiases

apt_pref="apt"
apt_upgr="upgrade"

if [ -f ~/.config/fzf/key-bindings.zsh ]; then
    . ~/.config/fzf/key-bindings.zsh
fi

# --- END ---
