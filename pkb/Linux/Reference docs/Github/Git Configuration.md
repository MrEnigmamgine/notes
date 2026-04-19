## Configuration
Git comes with a tool, `git config`, that can be used to automatically generate configuration files.

These configurations are stored in the following locations:
- `/etc/gitconfig`
- `~/.gitconfig`
- `~/.config/git/config`
- `.git/config (in the git directory)`

When called with the `--global` flag, the configuration will be stored in one of the first 3 (global) locations. (I'm not sure how it chooses, but in my experience it has seemed to respect XDG directory specs.)

Without the `--global` flag it should store the configuration in the repository's `.git` directory.
### Recommended settings
In order to use Git you need to set at least a name and email. For example:
```
git config --global user.name  "MrEnigmamgine"
git config --global user.email "mayes.joshua.d@gmail.com"
```

If using github, the modern convention for naming the initial branch is to name it `main`
```sh
git config --global init.defaultBranch main
```