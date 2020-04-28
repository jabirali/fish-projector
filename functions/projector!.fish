#!/usr/bin/env fish

function projector! -d 'Create project'
	# Check that variables are set.
	if [ ! -d "$projector_dir" ]
		echo 'You need to set $projector_dir.'
		return 1
	end
	
	# Determine the project name.
	read -lp 'echo -ne "\e[1mProject name: \e[0m"' name
	set -l dir "$projector_dir/$name"
	if [ -d "$dir" ]
		echo "Error: \"$dir\" exists!"
		return 1
	end
	
	# Create the new project.
	echo ":: Creating project."
	mkdir -p "$dir" || return 1
	
	echo ":: Opening project."
	cd "$dir" || return 1
	
	echo ":: Setting up Git."
	git init . || return 1
	
	# Create a virtualenv.
	mkdir -p "$HOME/.virtualenvs" || return 1
	set -l venv "$HOME/.virtualenvs/$name"
	if [ ! -d "$venv" ]
		# Create the venv itself.
		echo ":: Creating virtualenv."
		python3 -m venv "$venv"
	end
	
	# Activate virtualenv.
	echo ":: Activating virtualenv."
	source "$venv/bin/activate.fish"
	
	# Setup the virtualenv.
	if [ -n "$projector_pip" ]
		echo ":: Setting up virtualenv."
		pip3 install $projector_pip
	end
end
