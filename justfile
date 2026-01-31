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
    jq -r 'to_entries[] | "s/\(.key)/\(.value)/g"' {{SRC_PALETTE}}/nightmare.jsonc \
        > {{DIST_PALETTE}}/nightmare.sed

build-icon: setup
    set -e
    convert \
        -define icon:auto-resize=256,48,32,24,16 \
        -background none \
        "{{SRC_ICON}}/nightmare.svg" \
        "{{DIST_ICON}}/nightmare.ico"
    convert \
        -define icon:auto-resize=256,48,32,24,16 \
        -background none \
        "{{SRC_ICON}}/daydream.svg" \
        "{{DIST_ICON}}/daydream.ico"

build-vscode: build-palette build-icon
    sed -f "{{DIST_PALETTE}}/nightmare.sed" \
        <"{{SRC_VSCODE}}/nightmare.jsonc" \
        >"{{DIST_VSCODE}}/nightmare.json"

publish-vscode: build-vscode
    vsce publish minor && git push