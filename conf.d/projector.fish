#!/usr/bin/env fish

# Abbreviate main projector functions.
abbr -ga p projector

# Autoactivate virtual environments.
set _projector_venv ~/.virtualenvs/(basename (git rev-parse --show-toplevel 2>/dev/null || echo - ))/bin/activate.fish

if [ -e "$VIRTUAL_ENV" ]
	source "$VIRTUAL_ENV/bin/activate.fish"
else if [ -f "$_projector_venv" ]
	source "$_projector_venv"
end
