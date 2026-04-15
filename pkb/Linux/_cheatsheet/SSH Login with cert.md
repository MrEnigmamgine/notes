
Most modern systems include a script to make this easy:
```
ssh-copy-id -i ~/.ssh/id_ed25519 user@host
```

If this is not available, the identity key needs to be stored on the remote host as:
`~/.ssh/authorized_keys` which must have `0600` permissions.

An easy way to make this happen is below:
```sh
scp ~/.ssh/id_ed25519.pub user@host:~/newkey.pub
ssh user@host "\
mkdir -p ~/.ssh &&\
chmod 700 ~/.ssh &&\
cat ~/newkey.pub >> ~/.ssh/authorized_keys &&\
chmod 600 ~/.ssh/authorized_keys &&\
rm ~/newkey.pub"
```