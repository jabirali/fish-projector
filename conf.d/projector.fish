#!/usr/bin/env fish

# Abbreviate main projector functions.
abbr -ga p projector
abbr -ga pp projector_py
abbr -ga pg projector_git

# Autoactivate virtual environments.
if [ -e "$VIRTUAL_ENV" ]
	source $VIRTUAL_ENV/bin/activate.fish
end
