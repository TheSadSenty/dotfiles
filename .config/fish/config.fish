if status is-interactive
    # Commands to run in interactive sessions can go here
    alias 1920x1080="xrandr --output Virtual1 --mode '1920x1080'"
    alias 1366x768="xrandr --output Virtual1 --mode '1366x768'"

    alias cat="bat"
end



set -gx EDITOR "nvim"
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

setxkbmap -layout us,ru -option 'grp:win_space_toggle'

fish_add_path ~/.cargo/bin/
fish_add_path ~/go/bin/

