#!/usr/bin/env just

DIST := "./dist"
DIST_SCHEMES := DIST + "/schemes"
DIST_MAC_TERMINAL := DIST + "/mac_terminal"
DIST_VSCODE := "."
DIST_OPENCODE := DIST + "/opencode"

OPENCODE_THEMES := "$HOME/.config/opencode/themes"

default:
    just --list

setup:
    @mkdir -p {{ DIST_MAC_TERMINAL }}

clean:
    @rm -rf {{ DIST }}

build-terminal: setup
    uv run "./src/generate_schemes.py"

build-mac-terminal: build-terminal
    uv run "./src/iterm2terminal.py" "{{ DIST_SCHEMES }}" "{{ DIST_MAC_TERMINAL }}"

build-vscode: build-terminal
    npx vsce package --out "{{ DIST_VSCODE }}/tropical-theme.vsix"
    @echo " * $(realpath {{ DIST_VSCODE }}/tropical-theme.vsix)"

build: build-mac-terminal build-vscode

install-opencode: build-terminal
    @mkdir -p {{ OPENCODE_THEMES }}
    rsync -av {{ DIST_OPENCODE }}/ {{ OPENCODE_THEMES }}/

publish-vscode: build-vscode
    npx vsce publish minor && git push
