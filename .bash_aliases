alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if command_exists git; then
	alias gst='git status'
	alias ga='git add'
	alias gc='git commit'
	alias gd='git diff'
	alias gl='git pull'
	alias gp='git push'
fi
