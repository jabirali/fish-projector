#!/usr/bin/env fish

function projector_git -d 'Create Git project'
	# Check that variables are set.
	if [ ! -d "$projector_dir" ]
		echo 'You need to set $projector_dir.'
		return 1
	end
	
	# Check command line arguments.
	if [ -z "$argv" ]
		echo 'Please provide a project name.'
		return 1
	end
	
	# Determine the project name.
	set -l dir "$projector_dir/$argv"
	if [ -d "$dir" ]
		echo "Error: \"$dir\" exists!"
		return 1
	end
	
	# Create the new project.
	echo ":: Creating Git project."
	mkdir -p "$dir" || return 1
	cd "$dir"       || return 1
	git init .      || return 1
end
