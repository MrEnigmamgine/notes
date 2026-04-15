By default there's a "sticky-ness" when moving your mouse between multiple monitors.  This is a "feature" implemented in the wayland version of KDE.

It is controlled by `Edge Barrier` under `Screen Edges` in system settings. Setting it to 1px removes any stickyness.

Alternatively, assert the following exists in `~/.config/kwinrc`
```c
[EdgeBarrier]
EdgeBarrier=1
```
