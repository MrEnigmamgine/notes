
- Building software from source requires a toolchain for compiling languages into assembly.
	- gcc and dependencies
	- Some tools for working in a linux environment (to use configure scripts and make tests)
		- m4, ncurses, bash, coreutils, diffutils, file, findutils, gawk, grep, gzip, make, patch, sed, tar, xz, binutils, gcc

A minimal system configuration requires that some files exist.

/etc/mtab - legacy role consumed  by kernel, typically linked from /proc/self/mounts
/etc/hosts - statically map hostnames to ip addresses (localhost to loopback at minimum)
/etc/passwd - defines the users and uids on the system
/etc/group - defines groups and gids on the system
