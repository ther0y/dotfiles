
export ZSH="/Users/masood/.oh-my-zsh"

export PYTHONIOENCODING=utf-8

export BAT_THEME="TwoDark"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--height 60% --border --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK="$ANDROID_HOME/ndk-bundle"
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"

export PYTHON_2_BIN="$HOME/Library/Python/2.7/bin"
export FLUTER_HOME="$HOME/development/flutter/bin"
export COMPOSER_BIN="$HOME/.composer/vendor/bin"
export EMACS_BIN="$HOME/.emacs.d/bin"

export PATH="$PATH:$FLUTER_HOME:$ANDROID_PLATFORM_TOOLS:$PYTHON_2_BIN:$COMPOSER_BIN:$EMACS_BIN"

export JQPATH=/usr/local/bin

ZSH_THEME="robbyrussell"
#ZSH_THEME="spaceship"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

alias c="clear"
alias v="nvim"
alias pa="php artisan"
alias tmux='tmux -2'
alias d="docker"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/sbin:$PATH"

function zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}
