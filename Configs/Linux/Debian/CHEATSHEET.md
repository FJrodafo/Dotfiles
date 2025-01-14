## Index

1. [bspwm/sxhkd](#bspwmsxhkd)
2. [zathura](#zathura)

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
        <td><kbd>XF86Audio</kbd> { <kbd>Mute</kbd>, <kbd>LowerVolume</kbd>, <kbd>RaiseVolume</kbd> }</td>
        <td>Audio</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Alt</kbd> + { <kbd>Down</kbd>, <kbd>Up</kbd> }</td>
        <td>Brightness</td>
    </tr>
    <tr>
        <td><kbd>XF86Calculator</kbd></td>
        <td>Calculator</td>
    </tr>
    <tr>
        <td><kbd>Print</kbd></td>
        <td>Screenshots</td>
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
        <td>Program launcher</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Space</kbd></td>
        <td>Emoji picker</td>
    </tr>
    <tr>
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Space</kbd></td>
        <td>Powermenu</td>
    </tr>
</table>

#### Tiled Windows

<table>
    <tr>
        <td><kbd>Super</kbd> + <kbd>M</kbd></td>
        <td>Alternate between the tiled and monocle layout</td>
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
        <td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + { <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Up</kbd>, <kbd>Right</kbd> }</td>
        <td>Smart resize</td>
    </tr>
</table>

## zathura

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