#!/usr/bin/env just

SRC_VSCODE := "./src/vscode"
SRC_PALETTE := "./src/palette"
SRC_ICON := "./src/icon"
SRC_TERMINAL := "./src/terminal"
DIST_ROOT := "./dist"
DIST_VSCODE := "./dist/vscode"
DIST_PALETTE := "./dist/palette"
DIST_ICON := "./dist/icon"
DIST_TERMINAL := "./dist/terminal/yaml"

default:
    just --list

setup:
    @mkdir -p {{DIST_VSCODE}} {{DIST_ICON}} {{DIST_PALETTE}} {{DIST_TERMINAL}}

build-icon: setup
    convert \
        -define icon:auto-resize=256,48,32,24,16 \
        -background none \
        "{{SRC_ICON}}/stego.svg" \
        "{{DIST_ICON}}/stego.ico"

build-palette: setup
    jq -r 'to_entries[] | "s/\(.key)/\(.value)/g"' {{SRC_PALETTE}}/nightmare.json \
        > {{DIST_PALETTE}}/nightmare.sed
    jq -r 'to_entries[] | "s/\(.key)/\(.value)/g"' {{SRC_PALETTE}}/daydream.json \
        > {{DIST_PALETTE}}/daydream.sed

build-terminal: build-palette
    sed -f "{{DIST_PALETTE}}/nightmare.sed" <"{{SRC_TERMINAL}}/nightmare.yml" \
        >"{{DIST_TERMINAL}}/stego-nightmare.yml"
    sed -f "{{DIST_PALETTE}}/daydream.sed" <"{{SRC_TERMINAL}}/daydream.yml" \
        >"{{DIST_TERMINAL}}/stego-daydream.yml"
    uv run "./src/tools/generate_terminal_schemes.py"

build-vscode: build-palette build-icon
    sed -f "{{DIST_PALETTE}}/nightmare.sed" <"{{SRC_VSCODE}}/nightmare.jsonc" \
        >"{{DIST_VSCODE}}/nightmare.json"
    sed -f "{{DIST_PALETTE}}/daydream.sed" <"{{SRC_VSCODE}}/daydream.jsonc" \
        >"{{DIST_VSCODE}}/daydream.json"

publish-vscode: build-vscode
    vsce publish minor && git push

clean:
    rm -rf {{DIST_ROOT}}