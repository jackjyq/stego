#!/usr/bin/env just

TARGET := "./dist"
TARGET_SCHEMES := TARGET + "/schemes"
TARGET_MAC_TERMINAL := TARGET + "/mac_terminal"
TARGET_VSCODE := "."

default:
    just --list

setup:
    @mkdir -p {{ TARGET_MAC_TERMINAL }}

build-schemes: setup
    uv run "./src/generate_schemes.py"

build-terminal: build-schemes
    uv run "./src/iterm2terminal.py" "{{ TARGET_SCHEMES }}" "{{ TARGET_MAC_TERMINAL }}"

build-vscode: build-schemes
    npx vsce package --out "{{ TARGET_VSCODE }}/tropical-theme.vsix"
    @echo " * $(realpath {{ TARGET_VSCODE }}/tropical-theme.vsix)"

build: build-terminal build-vscode

clean:
    @rm -rf {{ TARGET }}


publish-vscode: build-vscode
    npx vsce publish minor && git push
