TEMPLATE_DIR := "./src/template"
COLOR_PALETTE_DIR := "./src/palette"
VSCODE_THEME_DIR := "./build/vscode"

default:
    just --list

setup:
    mkdir -p {{VSCODE_THEME_DIR}}

build-vscode:
    just setup
    sed -f {{COLOR_PALETTE_DIR}}/stego-nightmare.sed <{{TEMPLATE_DIR}}/stego-nightmare.template.jsonc >{{VSCODE_THEME_DIR}}/stego-nightmare.json

publish-vscode:
    just build-vscode
    vsce publish minor