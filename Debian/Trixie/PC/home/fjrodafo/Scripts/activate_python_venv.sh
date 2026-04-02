#!/bin/bash

# Activate the Python virtual environment in the current directory if it exists.

VENV_ACTIVATE="venv/bin/activate"

if [ -f "$VENV_ACTIVATE" ]; then
    echo "Virtual environment found. Activating..."
    source "$VENV_ACTIVATE"
    echo "Virtual environment activated: $(python --version 2>&1)"
else
    echo "Error: No py virtual environment was found..." >&2
    echo "You can create one with: python3 -m venv venv" >&2
fi
