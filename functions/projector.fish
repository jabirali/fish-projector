#!/usr/bin/env fish

function projector -d 'Open project'
	# Check that variables are set.
	if [ ! -d "$projector_dir" ]
		echo 'You need to set $projector_dir.'
		exit 1
	end
	
	# Check what previewer to use.
	if [ (command -v batcat) ]
		set preview "batcat -p --color=always"
	else if [ (command -v bat) ]
		set preview "bat -p --color=always"
	else
		set preview "cat"
	end
	
	# Discover and select projects.
	set -l dir \
		( fd -HIt d '^\.git$' $projector_dir  \
		| sed 's|/\.git$||'                   \
		| fzf --prompt 'Project> '            \
			  --query="$argv"                 \
			  --delimiter=/ --with-nth=-1     \
			  --preview-window right:65%      \
			  --preview="$preview {..}/README{.md,.org,.txt,} 2>/dev/null" )
	
	# Handle the choice made above.
	if [ -n "$dir" ]
		# Switch to the selected project.
		cd "$dir"
		set -l name (basename (pwd))
		set -l venv ~/.virtualenvs/$name
		echo "Switching to \"$name\"."
		
		# Load associated virtualenv.
		if [ -e "$venv" ]
			echo "Activating virtualenv."
			source $venv/bin/activate.fish
		else if type -q deactivate
			echo "Deactivating virtualenv."
			deactivate
		end
	end
end

