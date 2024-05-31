if status is-interactive
	# Commands to run in interactive sessions can go here
	alias full_hd="xrandr --output Virtual1 --mode '1920x1080'"
	alias cat="bat"
	
	set -gx EDITOR "nvim"
	setxkbmap -layout us,ru -option 'grp:win_space_toggle'
	set -gx SSH_AUTH_SOCK /run/user/1000/ssh-agent.socket
end
