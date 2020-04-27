#!/usr/bin/env fish

function venv -d 'Python virtual environments'
	# Determine the venv name.
	set -l name (basename (pwd))
	set -l venv ~/.virtualenvs/$name
	
	# Setup git if necessary.
	if [ ! -d ".git" ]
		echo "Creating Git repository."
		git init .
	end
	
	# Setup venv if necessary.
	if [ ! -d "$venv" ]
		# Create the venv itself.
		echo "Creating virtual environment."
		python3 -m venv "$venv"
		
		# Bootstrap the venv.
		echo "Setting up virtual environment."
		pip3 install black poetry python-language-server[all]
	end
	
	# Activate the venv in any case.
	echo "Activating virtual environment."
	source "$venv/bin/activate.fish"
end
