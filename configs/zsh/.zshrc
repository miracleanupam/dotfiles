# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="sunrise"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

VIRTUAL_ENV_DISABLE_PROMPT=true
autoload -U promptinit; promptinit
prompt spaceship

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
# )

source $ZSH/oh-my-zsh.sh

# if [[ $(nmcli device | grep wifi | grep -w "connected" | wc -l) -eq 0 ]]; then
# 	nmcli device wifi connect "wifi-id" password "********" hidden yes
# fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'
export TERMINAL='urxvt'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias firefox="firefox-developer-edition"
export ANDROID_HOME=$HOME/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$PATH:$HOME/flutter/flutter/bin"
export no_proxy="localhost,127.0.0.1"
export PATH="$PATH":"$HOME/flutter/flutter/.pub-cache/bin"
export RANGER_LOAD_DEFAULT_RC=false

# Aalto Specific
alias cdfs="cd $HOME/Aalto/FullStack/"
alias cdis="cd $HOME/Aalto/InfoSec/"
alias cdcr="cd $HOME/Aalto/Cryptography/"
alias cdcs="cd $HOME/Aalto/CloudSoft/"

# Git aliases
alias gss="git status"
alias gd="git diff"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcom="git checkout master"
alias gpo="git push origin"
alias gpom="git push origin master"
alias gpu="git pull"
alias gpum="git pull origin master"
alias gm="git merge"
alias gr="git restore"
alias grs="git restore --staged"
alias ga="git add"
alias gct="git commit -m"
alias gl="git log"

SPACESHIP_PROMPT_ORDER=(
	dir           # Current directory section
	git           # Get section (git_branch + git status)
        docker        #Docker section
	venv          # virtualenv section
	terraform     # Terraform workspace section
	exec_time     # Execution time
	line_sep      # Line break
	jobs          # Background jobs indicator
	exit_code     # Exit code section
	char          # Prompt character
    )
