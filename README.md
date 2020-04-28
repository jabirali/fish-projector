# Fish Projector

Fish plugin for managing code projects. Currently, it only handles
Git and Python projects, but may be generalized in the future. Feel 
free to send a pull request if you have some suggestions for that.

Basically, typing `p` or `projector` in Fish lets you fuzzy-search for
Git projects in what you define as `$projector_dir` using `fd` and `fzf`.
As a preview, you get to see the `README` file of each of your projects.
When you select a projects, you `cd` into it. If a corresponding virtual 
environment exists in `~/.virtualenvs/`, it is automatically activated.
Thus, this works as a quick and efficient command-line project manager.

To create new projects, you can use the functions `projector_py` for a
Python + Git project or `projector_git` for a pure Git project. If you
create a Python project, a virtual environment in `~/.virtualenvs/` is
automatically created for you, and any packages listed in the variable 
`$projector_pip` are installed via `pip3` after setting this up.

To install the plugin via `fisher`:

    fisher add jabirali/fish-projector
