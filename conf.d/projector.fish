#!/usr/bin/env fish

# Abbreviate main projector functions.
abbr -ga p projector

# Autoactivate virtual environments.
set projector (basename (git rev-parse --show-toplevel 2>/dev/null || echo - ))
if [ -e "$VIRTUAL_ENV" ]
	source $VIRTUAL_ENV/bin/activate.fish
else if [ -f ~/.virtualenvs/$projector ]
	source ~/.virtualenvs/$projector
end
