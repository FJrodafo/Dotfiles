<div align = center>
<h2>Debian 12 (Bookworm)<br />Keybinds</h2>
&ensp;<a href="https://debian.org/"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Debian.svg" width="24" height="24" /></a>&ensp;
&ensp;<a href="https://github.com/FJrodafo/Dotfiles/blob/main/Configs/Linux/README.md"><kbd>Home</kbd></a>&ensp;
&ensp;<a href="https://github.com/FJrodafo/Dotfiles/blob/main/Configs/Linux/Debian/Bookworm/INSTALL.md"><kbd>Install</kbd></a>&ensp;
&ensp;<a href="https://github.com/torvalds/linux"><img src="https://raw.githubusercontent.com/FJrodafo/Dotfiles/main/Assets/SVG/Linux.svg" width="24" height="24" /></a>&ensp;
<br />
</div>

## Index

1. [bspwm/sxhkd](#bspwmsxhkd)
    1. [WM Independent Hotkeys](#wm-independent-hotkeys)
    2. [Special Keys](#special-keys)
    3. [Apps](#apps)
    4. [Tiled Windows](#tiled-windows)
2. [Discord](#discord)
    1. [Streamer Mode](#streamer-mode)
    2. [Voice Channel](#voice-channel)
3. [MPV-Player](#mpv-player)
    1. [Controller](#controller)
4. [OBS](#obs)
    1. [Record a Video](#record-a-video)
5. [Zathura](#zathura)
    1. [Navigation](#navigation)
    2. [Bookmarks](#bookmarks)
    3. [Manipulation](#manipulation)
    4. [Miscellaneous](#miscellaneous)

## bspwm/sxhkd

#### WM Independent Hotkeys

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>R</kbd></td>
        <td>Restart bspwm</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Escape</kbd></td>
        <td>Make sxhkd reload its configuration files</td>
    </tr>
</table>

#### Special Keys

<table>
    <tr>
        <td><kbd>Print</kbd></td>
        <td>Screenshots</td>
    </tr>
    <tr>
        <td><kbd>XF86Audio</kbd> { <kbd>Mute</kbd>, <kbd>LowerVolume</kbd>, <kbd>RaiseVolume</kbd> }</td>
        <td>Audio</td>
    </tr>
    <tr>
        <td><kbd>XF86Calculator</kbd></td>
        <td>Calculator</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + { <kbd>F1</kbd>, <kbd>F2</kbd>, <kbd>F3</kbd> }</td>
        <td>Alternative audio</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + { <kbd>F2</kbd>, <kbd>F3</kbd> }</td>
        <td>Alternative mic</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F4</kbd></td>
        <td>Alternative mic</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + { <kbd>F5</kbd>, <kbd>F6</kbd> }</td>
        <td>Alternative brightness</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F7</kbd></td>
        <td>Toggle streamer mode (Discord)</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F8</kbd></td>
        <td>Alternative airplane mode</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F9</kbd></td>
        <td>Alternative support</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F10</kbd></td>
        <td>Switch to voice channel (Discord)</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F11</kbd></td>
        <td>Disconnect from voice channel (Discord)</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F12</kbd></td>
        <td>Alternative calculator</td>
    </tr>
</table>

#### Apps

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Return</kbd></td>
        <td>Terminal emulator</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>W</kbd></td>
        <td>Close</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd></td>
        <td>Kill</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Tab</kbd></td>
        <td>Open windows</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Space</kbd></td>
        <td>Application launcher</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd></td>
        <td>Program launcher</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>Space</kbd></td>
        <td>Emoji picker</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>e</kbd></td>
        <td>EWW (ElKowar's Wacky Widgets)</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>c</kbd></td>
        <td>Change wallpaper</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>a</kbd></td>
        <td>Run animated wallpaper</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>a</kbd></td>
        <td>Kill animated wallpaper</td>
    </tr>
</table>

#### Tiled Windows

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>M</kbd></td>
        <td>Alternate between the tiled and monocle layout</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>P</kbd></td>
        <td>Toggle focus follows pointer</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>1-4</kbd></td>
        <td>Focus on the given desktop</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-4</kbd></td>
        <td>Send the node to the given desktop</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + { <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Up</kbd>, <kbd>Right</kbd> }</td>
        <td>Move focus to {west, south, north, east}</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + { <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Up</kbd>, <kbd>Right</kbd> }</td>
        <td>Move focused window to {west, south, north, east}</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Alt</kbd> + { <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Up</kbd>, <kbd>Right</kbd> }</td>
        <td>Opens the next window to the {west,south,north,east}</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + { <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Up</kbd>, <kbd>Right</kbd> }</td>
        <td>Smart resize</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + { <kbd>-</kbd>, <kbd>+</kbd> }</td>
        <td>Dynamic gap size</td>
    </tr>
</table>

## Discord

#### Streamer Mode

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F7</kbd></td>
        <td>Toggle streamer mode</td>
    </tr>
</table>

#### Voice Channel

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F10</kbd></td>
        <td>Switch to voice channel</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>F11</kbd></td>
        <td>Disconnect from voice channel</td>
    </tr>
</table>

## MPV Player

#### Controller

<table>
    <tr>
        <td><kbd>1/2</kbd></td>
        <td>Contrast (-/+)</td>
    </tr>
    <tr>
        <td><kbd>3/4</kbd></td>
        <td>Brightness (-/+)</td>
    </tr>
    <tr>
        <td><kbd>5/6</kbd></td>
        <td>Gamma (-/+)</td>
    </tr>
    <tr>
        <td><kbd>7/8</kbd></td>
        <td>Saturation (-/+)</td>
    </tr>
    <tr>
        <td><kbd>9/0</kbd></td>
        <td>Volume (-/+)</td>
    </tr>
</table>

## OBS

#### Record a Video

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>1</kbd></td>
        <td>Start recording</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>2</kbd></td>
        <td>Stop recording</td>
    </tr>
</table>

## Zathura

#### Navigation

<table>
    <tr>
        <td><kbd>Tab</kbd></td>
        <td>Show index</td>
    </tr>
    <tr>
        <td><kbd>Shift</kbd> + <kbd>G</kbd></td>
        <td>Go to the end</td>
    </tr>
    <tr>
        <td><kbd>g</kbd> + <kbd>g</kbd></td>
        <td>Return to the beginning</td>
    </tr>
    <tr>
        <td><kbd>10</kbd> + <kbd>g</kbd> + <kbd>g</kbd> or <kbd>:10</kbd> + <kbd>Return</kbd></td>
        <td>Go to page 10</td>
    </tr>
    <tr>
        <td><kbd>Shift</kbd> + { <kbd>J</kbd>, <kbd>K</kbd> }</td>
        <td>Go forward/back a page</td>
    </tr>
    <tr>
        <td><kbd>Space</kbd></td>
        <td>Advance a view</td>
    </tr>
    <tr>
        <td><kbd>Scroll</kbd> or <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Up</kbd>, <kbd>Right</kbd> or <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd></td>
        <td>Move the view</td>
    </tr>
</table>

#### Bookmarks

<table>
    <tr>
        <td><kbd>m</kbd> + { <kbd>1</kbd>, <kbd>2</kbd>, <kbd>3</kbd>, <kbd>a</kbd>, <kbd>b</kbd>, <kbd>c</kbd>... }</td>
        <td>Temporary marker</td>
    </tr>
    <tr>
        <td><kbd>'</kbd> + { <kbd>1</kbd>, <kbd>2</kbd>, <kbd>3</kbd>, <kbd>a</kbd>, <kbd>b</kbd>, <kbd>c</kbd>... }</td>
        <td>Navigate to temporary marker</td>
    </tr>
</table>

#### Manipulation

<table>
    <tr>
        <td><kbd>Ctrl</kbd> + <kbd>Scroll</kbd> or <kbd>+</kbd>, <kbd>-</kbd></td>
        <td>Zoom</td>
    </tr>
    <tr>
        <td><kbd>Shift</kbd> + <kbd>=</kbd></td>
        <td>Reset zoom</td>
    </tr>
    <tr>
        <td><kbd>r</kbd></td>
        <td>Rotate</td>
    </tr>
    <tr>
        <td><kbd>Ctrl</kbd> + <kbd>r</kbd></td>
        <td>Invert color</td>
    </tr>
</table>

#### Miscellaneous

<table>
    <tr>
        <td><kbd>f</kbd></td>
        <td>Follow link</td>
    </tr>
    <tr>
        <td><kbd>d</kbd></td>
        <td>Book mode</td>
    </tr>
    <tr>
        <td><kbd>Shift</kbd> + <kbd>/</kbd></td>
        <td>Perform a search</td>
    </tr>
    <tr>
        <td><kbd>n</kbd> or <kbd>Shift</kbd> + <kbd>N</kbd></td>
        <td>Forward/backward in search</td>
    </tr>
    <tr>
        <td><kbd>:print</kbd> + <kbd>Return</kbd></td>
        <td>Open the printing software</td>
    </tr>
</table>