#!/usr/bin/env just

DIST := "./dist"
DIST_SCHEMES := DIST + "/schemes"
DIST_MAC_TERMINAL := DIST + "/mac_terminal"
DIST_VSCODE := "."
DIST_OPENCODE := DIST + "/opencode"
DIST_VIM := DIST + "/vim"

OPENCODE_THEMES := "$HOME/.config/opencode/themes"
VIM_THEMES := "$HOME/.vim/colors"

default:
    @just --list

clean:
    rm -rf {{ DIST }}

build-schema:
    @uv run "./src/generate_schemes.py"
    @uv run "./src/iterm2terminal.py" "{{ DIST_SCHEMES }}" "{{ DIST_MAC_TERMINAL }}"

build-vscode: build-schema
    @npx @vscode/vsce package --out "{{ DIST_VSCODE }}/tropical-time.vsix"
    @echo
    @echo "🌴 run the following command to install the theme and reload VSCode:"
    @echo "code --install-extension $(realpath {{ DIST_VSCODE }}/tropical-time.vsix)"

build: build-schema build-vscode

install-opencode: build-schema
    @mkdir -p {{ OPENCODE_THEMES }}
    @rsync -av {{ DIST_OPENCODE }}/ {{ OPENCODE_THEMES }}/
    @echo
    @echo "🌴 Please set theme in OpenCode settings"

publish-vscode: build-vscode
    @npx @vscode/vsce publish minor && git push

install-vim: build-schema
    @mkdir -p {{ VIM_THEMES }}
    @rsync -av {{ DIST_VIM }}/*.vim {{ VIM_THEMES }}/
    @echo
    @echo "🌴 Please set vim theme in ~/.vimrc"
    @echo ":set termguicolors"
    @echo ":colorscheme Tropical-<Variant>"
