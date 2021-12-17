#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nix-prefetch-github
#shellcheck shell=bash
nix-prefetch-github --no-fetch-submodules --rev master mpv-player mpv >> src.json
