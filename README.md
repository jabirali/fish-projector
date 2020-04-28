# Fish Projector

Fish plugin for managing code projects. Currently, the plugin only handles
Git and Python projects, but it may perhaps be generalized in the future.

Basically, this plugin lets you type `p` or `projector` in Fish to fuzzy-search
for Git projects in your `$projector_dir` via `fd` + `fzf`. As a preview, you get
to see the `README` file of each project directory, with syntax highlighting of
`README.md` and `README.org` files if you have `bat` installed. When you then
select a projects, `projector` will `cd` into it for you. If a virtual environment
with a matching name exists in `~/.virtualenvs/`, it is automatically activated.
Thus, this plugin works as a quick and efficient command-line project switcher.

To create new projects, you can use the functions `projector_py` for a
Python + Git project or `projector_git` for a pure Git project. If you
create a Python project, a virtual environment in `~/.virtualenvs/` is
automatically created for you, and any packages listed in the variable 
`$projector_pip` are installed via `pip3` after setting this up.

To install the plugin via `fisher`:

    fisher add jabirali/fish-projector
