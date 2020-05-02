# Fish Projector

Basically, this plugin lets you type `p` or `projector` in Fish to fuzzy-search for 
Git projects in your `$projector_dir` via `fd` and `fzf`. When selecting a project,
see the `README` file of each project as a preview. If the optional dependency `bat`
is installed, `README.md` and `README.org` files are shown with syntax highlighting.
After selecting a project, `projector` will `cd` into it for you. Thus, this plugin 
works as a quick and efficient project switcher for the command line.

![screenshot](screenshot.png)

If a Python virtual environment with a matching name exists in `~/.virtualenvs/`,
it is automatically activated after `cd`'ing into the project. If such a virtual 
environment was already active, it is disabled when switching to another project.
Finally, if Fish is started in a subdirectory of a Git project with a corresponding
virtual environment, as may happen if you e.g. start Fish in a project directory
from `tmux` or `nvim`, this virtual environment is again automatically activated.

To install the plugin via [`fisher`](https://github.com/jorgebucaran/fisher):

    fisher add jabirali/fish-projector

Please make sure that the dependencies `fd` and `fzf` are installed, and optionally
also `bat` if you want syntax highlighting. Then set the variable `$projector_dir`
to the path where you store your code projects in your `config.fish`, and type `p`
or `projector` when you want to switch between Git projects. 

To create Python virtual environments that are recognized by Projector,
you may also want this:

	alias 'mkvenv' 'python3 -m venv ~/.virtualenvs/(basename (pwd))'
