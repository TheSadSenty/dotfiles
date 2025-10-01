if status is-interactive
    # Commands to run in interactive sessions can go here
    alias 1920x1080="xrandr --output Virtual-1 --mode '1920x1080'"
    alias 1366x768="xrandr --output Virtual-1 --mode '1366x768'"

    alias cat="bat"
    if [ $TERM  = "xterm-kitty" ]
        alias icat="kitten icat"
    end
end

# https://michaeluloth.com/neovim-switch-configs/
function nvim
    # Assumes all configs exist in directories named ~/.config/nvim-*
    set -f config (fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

    # If I exit fzf without selecting a config, don't open Neovim
    if test -z $config
        command nvim $argv
        return
    end

    # Open Neovim with the selected config
    set -fx NVIM_APPNAME $(basename $config)
    command nvim $argv
end

set -gx EDITOR "nvim"
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

fish_add_path ~/.cargo/bin/
fish_add_path ~/go/bin/

