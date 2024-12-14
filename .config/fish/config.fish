set -g fish_greeting

function starship_transient_rprompt_func
  starship module time
end

if status is-interactive
    starship init fish | source

    #enable_transience
end

#eval (ssh-agent -c) > /dev/null


set -x EDITOR "nvim"
# set -x TERM "kitty"
set -x XDG_CONFIG_HOME "$HOME/.config"

set -x OBSIDIAN_VAULT "$HOME/Documents/My Notes"
set -x ELECTRON_OZONE_PLATFORM_HINT wayland


# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/roy/miniconda3/bin/conda
    eval /home/roy/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/roy/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/roy/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/roy/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

set -gx XDG_CURRENT_DESKTOP "KDE"
set -gx XDE_FULL_SESSION "true"

set -gx PATH "/home/roy/.config/composer/vendor/bin:/usr/local/go/bin" $PATH

set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

set -gx PATH "$(go env GOBIN):$(go env GOPATH)/bin" $PATH

zoxide init fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/roy/.cache/lm-studio/bin

#fish_ssh_agent

#function starship_transient_prompt_func
#	tput cuu1
#	starship module character
#end

#function prompt_newline --on-event fish_postexec
#	echo ""
#	echo ""
#end

alias clear "command clear; commandline -f clear-screen"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

source "$HOME/.cargo/env.fish"
