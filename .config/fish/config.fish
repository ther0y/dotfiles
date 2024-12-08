set -g fish_greeting

if status is-interactive
    starship init fish | source
end


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

set -gx PATH "/home/roy/.config/composer/vendor/bin" $PATH

set -gx SSH_AUTH_SOCK ~/.1password/agent.sock

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

zoxide init fish | source
