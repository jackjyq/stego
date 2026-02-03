#!/usr/bin/env just

SRC_VSCODE := "./src/vscode"
SRC_PALETTE := "./src/palette"
SRC_ICON := "./src/icon"
SRC_TERMINAL := "./src/terminal"

TARGET_VSCODE := "./build/vscode"
TARGET_PALETTE := "./build/palette"
TARGET_ICON := "./dist/icon"
TARGET_TERMINAL := "./dist/terminal/yaml"

default:
    just --list

setup:
    @mkdir -p {{TARGET_VSCODE}} {{TARGET_ICON}} {{TARGET_PALETTE}} {{TARGET_TERMINAL}}

build-icon: setup
    convert \
        -define icon:auto-resize=256,48,32,24,16 \
        -background none \
        "{{SRC_ICON}}/stego.svg" \
        "{{TARGET_ICON}}/stego.ico"

build-palette: setup
    jq -r 'to_entries[] | "s/\(.key)/\(.value)/g"' {{SRC_PALETTE}}/nightmare.json \
        > {{TARGET_PALETTE}}/nightmare.sed
    jq -r 'to_entries[] | "s/\(.key)/\(.value)/g"' {{SRC_PALETTE}}/daydream.json \
        > {{TARGET_PALETTE}}/daydream.sed

build-terminal: build-palette
    sed -f "{{TARGET_PALETTE}}/nightmare.sed" <"{{SRC_TERMINAL}}/nightmare.yml" \
        >"{{TARGET_TERMINAL}}/stego-nightmare.yml"
    sed -f "{{TARGET_PALETTE}}/daydream.sed" <"{{SRC_TERMINAL}}/daydream.yml" \
        >"{{TARGET_TERMINAL}}/stego-daydream.yml"
    uv run "./src/tools/generate_terminal_schemes.py"

build-vscode: build-palette build-icon
    sed -f "{{TARGET_PALETTE}}/nightmare.sed" <"{{SRC_VSCODE}}/nightmare.jsonc" \
        >"{{TARGET_VSCODE}}/nightmare.json"
    sed -f "{{TARGET_PALETTE}}/daydream.sed" <"{{SRC_VSCODE}}/daydream.jsonc" \
        >"{{TARGET_VSCODE}}/daydream.json"
    vsce package --out "{{TARGET_VSCODE}}/stego-theme.vsix"

publish-vscode: build-vscode
    vsce publish minor && git push