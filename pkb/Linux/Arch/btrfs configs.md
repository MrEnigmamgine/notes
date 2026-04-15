
I've chosen to use a nested subvolume layout with a clean toplevel subvolume.
```
/
	@
	@/var
		@/var/lib/machines
		@/log
		@/cache
		@/tmp
	@/home
	@/root
```
- The nested layout simplifies the `/ect/fstab` at the cost of potential obfuscation of the btrfs implementation.
	- It may be more difficult to differentiate directories from subvolumes using this layout.
- The clean toplevel (mounting the filesystem's `/@` to linux's `/` ) would make it easier to move subvolumes around in the future if desired, since the toplevel `/` cannot be moved.

Subvolumes are not included in parent volume's snapshots.

@ - Snapshot automatically when updating and on aggressive schedule

@/var - exclude from root snapshots
@/var/log - disable copy on write
@/var/cache - disable copy on write
@/var/tmp -disable copy on write
@/var/lib/machines - disable copy on write

@/home + @/root - snapshot on relaxed schedule