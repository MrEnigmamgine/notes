
## Root and Rootless containers

__Root containers__ are containers that are launched using the host's root account.
__Rootless containers__ are containers launched without special permissions.

### Root vs rootless
When a process inside of a container runs as root, on the host it uses the UID of the user that launched the container.

 Non root processes will run inside of a user namespace using `shadow-utils` and will inherit a `subuid` and `subgid` of that user.
- For this to work it is appropriate that the appropriate entries exist in `/etc/subuid` and `/etc/subgid`

### Configuration
 To make unqualified container names behave like docker there should be a drop-in config:
```toml
# /etc/containers/registries.conf.d/10-unqualified-search-registries.conf  
unqualified-search-registries = ["docker.io"]
```
