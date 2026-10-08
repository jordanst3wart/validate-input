#!/usr/bin/env bash
# Fails unless $1 is non-empty and contains only letters, digits and spaces.
# The value is deliberately never echoed, so it cannot inject workflow commands into the log.
[[ "$1" =~ ^[A-Za-z0-9\ ]+$ ]] || { echo "::error::Invalid input: only letters, digits and spaces are allowed"; exit 1; }
