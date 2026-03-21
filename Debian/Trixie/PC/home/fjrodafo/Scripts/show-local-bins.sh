#!/bin/bash

echo "~/.local/bin/"
ls ~/.local/bin/ | sed 's/^/    /'

echo "/usr/local/bin/"
ls /usr/local/bin/ | sed 's/^/    /'
