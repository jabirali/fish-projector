#!/usr/bin/env fish

function projector -d 'Open project'
	# Check that variables are set.
	if [ ! -d "$projector_dir" ]
		echo 'You need to set $projector_dir.'
		return 1
	end
	
	# Check what preview to use.
	if [ (command -v batcat) ]
		set preview "batcat -p --color=always"
	else if [ (command -v bat) ]
		set preview "bat -p --color=always"
	else
		set preview "cat"
	end
	
	# Check what search to use.
	if [ (command -v fdfind) ]
		set search (fdfind -HIt d '^\.git$' $projector_dir | string collect)
	else if [ (command -v fd) ]
		set search (fd -HIt d '^\.git$' $projector_dir | string collect)
	else
		set search (find $projector_dir -type d -name '.git' | string collect)
	end
	
	# Select a project.
	set project \
		( echo $search                             \
		| sed "s|$projector_dir/\(.*\)/\.git|\1|"  \
		| fzf --prompt 'Project> '                 \
			  --query="$argv"                      \
			  --preview-window right:65%           \
			  --preview="$preview $projector_dir/{..}/README{.md,.org,.txt,} 2>/dev/null" )
	
	# Switch to project.
	if [ -n "$project" ]
		cd "$projector_dir/$project"
	end
end
