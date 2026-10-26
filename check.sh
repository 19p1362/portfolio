#!/usr/bin/env bash
# Structural check for index.html — fails if a hook the animations depend on disappears.
set -e
f=index.html
need() { grep -q "$1" "$f" || { echo "MISSING: $1"; exit 1; }; }
need '<title>Gonela Abhilash'
need 'id="actor"'
need 'id="say"'
need 'class="smile"'
need 'class="mouth"'
need 'class="eyes"'
need 'class="arw"'
need "class='rip'\|class=\"rip\"\|className = 'rip'"
need 'prefers-reduced-motion'
need '+44 7344 796772'
need 'bisandey@gmail.com'
[ "$(grep -c '<section' "$f")" = "3" ] || { echo "MISSING: expected 3 sections"; exit 1; }
echo "ok: 3 sections, actor hooks, reduced-motion, contact details"
