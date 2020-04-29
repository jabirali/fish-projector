#!/usr/bin/env fish

# Abbreviate main projector functions.
abbr -ga p projector

# Autoactivate virtual environments.
if [ -e "$VIRTUAL_ENV" ]
	source $VIRTUAL_ENV/bin/activate.fish
end
