SRC_TEMPLATE := "./src/template"
SRC_PALETTE := "./src/palette"
SRC_ICON := "./src/icon"
DIST_VSCODE_THEME := "./dist/vscode"
DIST_ICON := "./dist/icon"

default:
    just --list

setup:
    mkdir -p {{DIST_VSCODE_THEME}}
    mkdir -p {{DIST_ICON}}

build-vscode: setup
    sed -f {{SRC_PALETTE}}/stego-nightmare.sed <{{SRC_TEMPLATE}}/stego-nightmare.template.jsonc >{{DIST_VSCODE_THEME}}/stego-nightmare.json

publish-vscode: build-vscode build-icon
    vsce publish minor

build-icon: setup
    #!/usr/bin/env bash
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

