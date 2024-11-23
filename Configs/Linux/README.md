## Distro

[Debian 12.8.0](https://www.debian.org/)

## Fonts

Install a font manually by downloading the appropriate .ttf or otf files and placing them into `/usr/local/share/fonts` (system-wide), `~/.local/share/fonts` (user-specific) or `~/.fonts` (user-specific). These files should have the permission 644 (-rw-r--r--), otherwise they may not be usable.

Run `fc-cache` to update the font cache (add `-v` for verbose output). The above mentioned paths can be customized in the fontconfig configuration file at `/etc/fonts/fonts.conf` – you can also include subdirectories or links, which is useful if you have a directory of fonts on a separate hard drive (or partition or other location).

## Avoid Screen Tearing NVIDIA

> /etc/X11/xorg.conf.d/20-nvidia.conf

```conf
Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    Option         "ForceFullCompositionPipeline" "on"
    Option         "AllowIndirectGLXProtocol" "off"
    Option         "TripleBuffer" "on"
EndSection
```

