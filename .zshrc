
export ZSH="/Users/masood/.oh-my-zsh"
export EDITOR='nvim'
export PYTHONIOENCODING=utf-8

#export GOPATH=$HOME/golang
#export GOROOT=/usr/local/opt/go/libexec
#export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOPATH
#export PATH=$PATH:$GOROOT/bin

export BAT_THEME="TwoDark"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--height 60% --border --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK="$ANDROID_HOME/ndk-bundle"
export ANDROID_PLATFORM_TOOLS="$ANDROID_HOME/platform-tools"
export MY_SHELL_SCRIPTS="$HOME/.sh"

export PYTHON_2_BIN="$HOME/Library/Python/2.7/bin"
export FLUTER_HOME="$HOME/development/flutter/bin"
export COMPOSER_BIN="$HOME/.composer/vendor/bin"
export EMACS_BIN="$HOME/.emacs.d/bin"
export GO_BIN="$HOME/go/bin"
export SOLANAPATH="/Users/masood/.local/share/solana/install/active_release/bin"

export PATH="$MY_SHELL_SCRIPTS:$FLUTER_HOME:$ANDROID_PLATFORM_TOOLS:$PYTHON_2_BIN:$COMPOSER_BIN:$EMACS_BIN:$GO_BIN:$SOLANAPATH:$PATH"

export JQPATH=/usr/local/bin

ZSH_THEME="robbyrussell"
#ZSH_THEME="spaceship"

plugins=(git docker zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh

alias c="clear"
alias v="nvim"
alias pa="php artisan"
alias tmux='tmux -2'
alias d="docker"
alias gsum="git stash -u -m"
alias k="kubectl"
alias ctags="`brew --prefix`/bin/ctags"
alias cat="bat"
complete -F __start_kubectl k

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/sbin:$PATH"

function zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

function tn() {
  TMUX_NEW_DIR=$(pwd | sed 's/.*\///g')
  tmux new -s $TMUX_NEW_DIR
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/k8s-kubeconfig
#

# Set the default kube context if present
DEFAULT_KUBE_CONTEXTS="$HOME/.kube/config"
if test -f "${DEFAULT_KUBE_CONTEXTS}"
then
  export KUBECONFIG="$DEFAULT_KUBE_CONTEXTS"
fi

# Additional contexts should be in ~/.kube/custom-contexts/ 
CUSTOM_KUBE_CONTEXTS="$HOME/.kube/custom-contexts"
mkdir -p "${CUSTOM_KUBE_CONTEXTS}"

OIFS="$IFS"
IFS=$'\n'
for contextFile in `find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yml"`  
do
    export KUBECONFIG="$contextFile:$KUBECONFIG"
done
IFS="$OIFS"

export KREW_PATH="${HOME}/.krew/bin"
# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH:$KREW_PATH"


# Load Angular CLI autocompletion.
#source <(ng completion script)
#source /usr/local/opt/spaceship/spaceship.zsh

eval "$(zoxide init zsh)"
