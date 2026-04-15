### Common Flags

| Flag | Long Flag | Usage                                             |
| ---- | --------- | ------------------------------------------------- |
| -S   | --sync    | Installs packages                                 |
| -R   | --remove  | Removes packages                                  |
| -Q   | --query   | Queries the installed packages database           |
| -U   | --upgrade | Upgrades packages with "remove-then-add" process  |
| -F   | --files   | Determine which package owns a file or vice-versa |
| -v   | --verbose | Prints more info                                  |


### Cheatsheet
```sh
# Refresh repository DB and upgrade all out-of-date packages
pacman -Syu

# Install a package
pacman -S foo

# List all explicitly installed packages
pacman -Qe

# Remove a package and unused dependencies
pacman -Rs foo

# Mark a package as explicitly installed
pacman -D --asexplicit foo
# Mark a package as installed by dependency
pacman -D --asdeps foo

# List files owned by a package
pacman -Fl foo

# List packages that own a file
pacman -F /etc/foo.conf
```


### What happens during package install/upgrade/removal

When successful, the workflow of a transaction follows five high-level steps plus pre/post transaction hooks:

1. Initialize the transaction if there is not a database lock.
2. Choose which packages will be added or removed in the transaction.
3. Prepare the transaction, based on flags, by performing sanity checks on the sync databases, packages, and their dependencies.
4. Commit the transaction:
    1. When applicable, download packages (`_alpm_sync_load`).
    2. If pre-existing _pacman_ `PreTransaction` hooks apply, they are executed.
    3. Packages are removed that are to-be-replaced, conflicting, or explicitly targeted to be removed.
    4. If there are packages to add, then each package is committed:
        1. If the package has an install script, its `pre_install` function is executed (or `pre_upgrade` or `pre_remove` in the case of an upgraded or removed package).
        2. _pacman_ deletes all the files from a pre-existing version of the package (in the case of an upgraded or removed package). However, files that were marked as configuration files in the package are kept (see [/Pacnew and Pacsave](https://wiki.archlinux.org/title/Pacman/Pacnew_and_Pacsave "Pacman/Pacnew and Pacsave")).
        3. _pacman_ untars the package and dumps its files into the file system (in the case of an installed or upgraded package). Files that would overwrite kept, and manually modified, configuration files (see previous step), are stored with a new name (_.pacnew_).
        4. If the package has an install script, its `post_install` function is executed (or `post_upgrade` or `post_remove` in the case of an upgraded or removed package).
    5. If _pacman_ `PostTransaction` hooks that exist at the end of the transaction apply, they are executed.
5. Release the transaction and transaction resource (i.e. database lock).

### Pacnew/Pacsave
When _pacman_ removes a package that has a configuration file, it normally creates a backup copy of that configuration file and appends _.pacsave_ to the name of the file. Likewise, when _pacman_ upgrades a package which includes a new configuration file created by the maintainer differing from the currently installed file, it saves a _.pacnew_ file with the new configuration. _pacman_ provides notice when these files are written.