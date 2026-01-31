#!/usr/bin/env bash

SRC_VSCODE := "./src/vscode"
SRC_PALETTE := "./src/palette"
SRC_ICON := "./src/icon"
DIST_VSCODE := "./dist/vscode"
DIST_PALETTE := "./dist/palette"
DIST_ICON := "./dist/icon"

default:
    just --list

setup:
    @mkdir -p {{DIST_VSCODE}}
    @mkdir -p {{DIST_ICON}}
    @mkdir -p {{DIST_PALETTE}}\

build-palette: setup
    jq -r 'to_entries[] | "s/\(.key)/\(.value)/g"' {{SRC_PALETTE}}/stego-nightmare.jsonc \
        > {{DIST_PALETTE}}/stego-nightmare.sed

build-icon: setup
    set -e
    convert \
        -define icon:auto-resize=256,48,32,24,16 \
        -background none \
        "{{SRC_ICON}}/stego-nightmare.svg" \
        "{{DIST_ICON}}/stego-nightmare.ico"
    convert \
        -define icon:auto-resize=256,48,32,24,16 \
        -background none \
        "{{SRC_ICON}}/stego-daydream.svg" \
        "{{DIST_ICON}}/stego-daydream.ico"

build-vscode: build-palette build-icon
    sed -f "{{DIST_PALETTE}}/stego-nightmare.sed" \
        <"{{SRC_VSCODE}}/stego-nightmare.template.jsonc" \
        >"{{DIST_VSCODE}}/stego-nightmare.json"

publish-vscode: build-vscode build-icon
    if [[ -n $(git status --porcelain) ]]; then
        echo "Error: There are uncommitted changes. Please commit or stash them before publishing."
        exit 1
    fi
    vsce publish minor && git push