TEMPLATE_DIR := "./templates"
VSCODE_THEME_DIR := "./themes"
COLOR_PALETTE_DIR := "./palette"

vscode-dark:
    sed -f {{COLOR_PALETTE_DIR}}/dark.sed <{{TEMPLATE_DIR}}/stego-nightmare.jsonc >{{VSCODE_THEME_DIR}}/stego-nightmare.json

default:
    vscode-dark
