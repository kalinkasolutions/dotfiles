# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Load node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# User configuration
alias ll="ls -lah"

PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin

PATH=$PATH:/opt/go/bin

export JAVA_HOME=/opt/jdk-17.0.15+6
PATH=$PATH:$JAVA_HOME/bin

PATH=$PATH:/opt/gradle-8.14/bin

export ANDROID_HOME=/opt/Android/Sdk
PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH

# Prefer config file over resolving domain domain
zstyle ':completion:*:ssh:*' hosts off
