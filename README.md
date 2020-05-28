# Fish Projector

This plugin lets you type `p` or `projector` in Fish to fuzzy-search Git
projects in your `$projector_dir` via [`fzf`][1]. While selecting a project,
the `README` file of each project is shown as a preview. When you select a
project, `projector` will `cd` into it for you. Thus, this plugin serves
as a quick and efficient project switcher for the command line.

![screenshot](screenshot.png)

If the optional dependency [`bat`][2] is installed, `README.md` and `README.org`
files are shown with syntax highlighting. If [`fd`][3] is installed, it is used
as a replacement for `find` to scan your project directory. Earlier versions
of this plugin also handled Python virtual environments, but I have since
switched to [`direnv`][4], and removed this redundant functionality.

To install the plugin via [`fisher`](https://github.com/jorgebucaran/fisher):

    fisher add jabirali/fish-projector

Please make sure that the dependency `fzf` is installed, and optionally also
`bat` and `fd`. Then set the variable `$projector_dir` to the path where you
store your code projects in `config.fish`, and try typing `p` or `projector`.

[1]: https://github.com/junegunn/fzf
[2]: https://github.com/sharkdp/bat
[3]: https://github.com/sharkdp/fd
[4]: https://github.com/direnv/direnv
