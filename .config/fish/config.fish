if status is-interactive
    # Commands to run in interactive sessions can go here
    alias 1920x1080="xrandr --output Virtual1 --mode '1920x1080'"
    alias 1366x768="xrandr --output Virtual1 --mode '1366x768'"

    alias cat="bat"
end



set -gx EDITOR "nvim"
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

setxkbmap -layout us,ru -option 'grp:win_space_toggle'

fish_add_path -a ~/.cargo/bin/

pyenv init - | source
