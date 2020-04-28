#!/usr/bin/env fish

function projector_py -d 'Create Python project'
	# Create a Git project.
	projector_git $argv || return 1
	
	# Create a virtualenv.
	mkdir -p "$HOME/.virtualenvs" || return 1
	set -l venv "$HOME/.virtualenvs/$argv"
	if [ ! -d "$venv" ]
		# Create the venv itself.
		echo -e "\n\e[1m:: Creating virtualenv\e[0m"
		python3 -m venv "$venv"
	end
	
	# Activate virtualenv.
	echo -e "\n\e[1m:: Activating virtualenv\e[0m"
	source "$venv/bin/activate.fish"
	
	# Setup the virtualenv.
	if [ -n "$projector_pip" ]
		echo -e "\n\e[1m:: Setting up virtualenv\e[0m"
		pip3 install $projector_pip
	end
end
