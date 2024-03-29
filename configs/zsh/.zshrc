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
HISTFILE=$HOME/.config/zsh/.zsh_history

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
bindkey -v
bindkey jj vi-cmd-mode
bindkey "^R" history-incremental-search-backward

# if [[ $(nmcli device | grep wifi | grep -w "connected" | wc -l) -eq 0 ]]; then
# 	nmcli device wifi connect "wifi-id" password "********" hidden yes
# fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
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

alias firefox=firefox-developer-edition
alias grepper=$HOME/custom_linux_commands/dmenu_scripts/grepper.sh
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$PATH:$HOME/flutter/bin"
export no_proxy="localhost,127.0.0.1"
export PATH="$PATH":"$HOME/flutter/.pub-cache/bin"
export RANGER_LOAD_DEFAULT_RC=false
export PATH="$PATH":"$GEM_HOME/bin"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# Git aliases
alias gss="git status"
alias gd="git diff"
alias gdd="git difftool"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcom="git checkout master || git checkout main"
alias gpo="git push origin"
alias gpom="git push origin master || git push origin main"
alias gpu="git pull"
alias gpum="git pull origin master || git pull origin main"
alias gm="git merge"
alias gr="git restore"
alias grs="git restore --staged"
alias ga="git add"
alias gct="git commit -m"
alias gl="git log"
alias gs="git stash"
alias gsa="git stash apply"
alias gsd="git stash drop"
alias gsh="git stash show"
alias gsl="git stash list"
alias gsm="git stash -m"
alias gsp="git stash pop"

# Mount aliases
# alias mcard="sudo mount /dev/mmcblk0p1 /mnt/mcard/"
# alias umcard="sudo umount -R /mnt/mcard"
# alias mwin="sudo mount /dev/nvme0n1p4 /mnt/windrive/"
# alias umwin="sudo umount -R /mnt/windrive"

# Utility aliases
alias xcopy="xclip -selection clipboard"

# Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.rvm/scripts/rvm
source /usr/share/nvm/init-nvm.sh

# Alias for toggling home and end keys
# alias homeon='xmodmap -e "keycode 108 = Home" && xmodmap -e "keycode 105 = End"'
# alias homeoff=setxkbmap

# Spaceship prompt settings
SPACESHIP_PROMPT_ORDER=(
	dir           # Current directory section
	git           # Get section (git_branch + git status)
  docker        # Docker section
	venv          # virtualenv section
	terraform     # Terraform workspace section
	exec_time     # Execution time
	line_sep      # Line break
	jobs          # Background jobs indicator
	exit_code     # Exit code section
	char          # Prompt character
)
