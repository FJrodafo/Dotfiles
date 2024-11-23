## Distro

[Debian 12.8.0](https://www.debian.org/)

## Avoid Screen Tearing NVIDIA

> /etc/X11/xorg.conf.d/20-nvidia.conf

```
Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    Option         "ForceFullCompositionPipeline" "on"
    Option         "AllowIndirectGLXProtocol" "off"
    Option         "TripleBuffer" "on"
EndSection
```

