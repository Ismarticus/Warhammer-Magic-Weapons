#!/bin/sh
echo -ne '\033c\033]0;WFRPMagicWeapons\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/wfrp-magic-weapons-v1.2.x86_64" "$@"
