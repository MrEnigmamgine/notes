## Useful flags
```sh
--dry-run          # Preview without making changes (ALWAYS use first!)
-v / --verbose     # Show progress and details
-vv                # Extra verbose
-P / --progress    # Show real-time transfer progress
--stats 1s         # Show stats every second
-i / --interactive # Confirm before each action
--log-file FILE    # Write logs to file
```

## Mounting
```sh
# Mount remote as local filesystem
rclone mount remote:path /mnt/cloud --daemon

# Mount with caching for better performance
rclone mount remote:path /mnt/cloud \
  --vfs-cache-mode full \
  --vfs-cache-max-size 10G

# Unmount
fusermount -u /mnt/cloud   # Linux
umount /mnt/cloud          # macOS

# Serve over HTTP
rclone serve http remote:path --addr :8080

# Serve over WebDAV
rclone serve webdav remote:path --addr :8080

# Serve over SFTP
rclone serve sftp remote:path --addr :2022
```

## Sync Patterns
```sh
# Local → Cloud backup
rclone sync /home/user/documents remote:backup/documents

# Cloud → Local restore
rclone sync remote:backup/documents /home/user/documents

# Cloud → Cloud migration
rclone sync gdrive:data dropbox:data

# Two-way sync
rclone bisync /local remote:path --resync  # Initial sync
rclone bisync /local remote:path           # Subsequent syncs
```

## Useful Combos
```sh
# Backup with progress and logging
rclone sync /data remote:backup \
  -P \
  --log-file backup-$(date +%Y%m%d).log \
  --log-level INFO

# Mirror with verification
rclone sync src dst --checksum && rclone check src dst

# Find large files
rclone ls remote: --min-size 100M

# Count files
rclone size remote:path

# Delete old backups
rclone delete remote:backup --min-age 30d --dry-run

# Deduplicate (remove duplicates)
rclone dedupe remote:path --dedupe-mode newest

# Compare two locations
rclone check local:path remote:path --combined report.txt
```

