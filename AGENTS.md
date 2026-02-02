# Agent Guidelines for Stego Theme Repository

This repository generates VSCode themes and terminal color schemes using a Python-based build system.

## Build Commands

The project uses `just` (a command runner) and `uv` (Python package manager):

```bash
# Setup and build all
just setup          # Create dist directories
just build-vscode   # Build VSCode themes
just build-terminal # Build terminal schemes
just build-icon     # Build icon from SVG
just package-all    # Package everything for release
just clean          # Remove dist/

# Python scripts (run via uv)
uv run ./src/tools/generate_terminal_schemes.py              # Generate all terminal themes
uv run ./src/tools/generate_terminal_schemes.py -s nightmare # Generate specific scheme
uv run ./src/tools/generate_terminal_schemes.py -t alacritty # Generate specific template

# List all just commands
just --list
```

## Project Structure

- `src/palette/` - Color definitions in JSON (nightmare.json, daydream.json)
- `src/vscode/` - VSCode theme templates (JSONC format with __PLACEHOLDER__ colors)
- `src/terminal/` - Terminal scheme definitions (YAML format)
- `src/tools/` - Python generation scripts and Jinja2 templates
- `src/tools/templates/` - Jinja2 templates for various terminal emulators
- `dist/` - Generated output (built from source)

## Code Style Guidelines

### Python Code

**Imports:** Standard library first, then third-party, sorted alphabetically within groups.

```python
from __future__ import annotations

import argparse
import json
import pathlib

from functools import cached_property
from typing import Any

import yaml
from jinja2 import Environment, FileSystemLoader
```

**Type Hints:** Use type hints for all function parameters and return types. Prefer specific types over `Any`.

**Classes:** Use `@dataclasses.dataclass(frozen=True)` for immutable data structures. Use `PascalCase` for class names.

**Methods:** Use `@cached_property` for expensive computed properties. Use `@staticmethod` or `@classmethod` when appropriate.

**Naming:**
- Functions: `snake_case`
- Variables: `snake_case`
- Constants: `UPPER_SNAKE_CASE`
- Class names: `PascalCase`
- Private members: `_leading_underscore`

**Error Handling:** Print errors to stderr with `print(..., file=sys.stderr)`. Use descriptive error messages.

**String Formatting:** Use f-strings consistently. No `.format()` or `%` formatting.

**Paths:** Always use `pathlib.Path` for path operations, never string manipulation.

**Assertions:** Use assert statements for invariant checks (e.g., directory existence).

### Theme Files

**VSCode (JSONC):** Use `.jsonc` extension. Include comments with VSCode API documentation links. Use `__CAPSLOCK_PLACEHOLDER__` for color tokens that get substituted.

**Terminal (YAML):** Use `.yml` extension. Include comments with source URLs. Map YAML keys to iTerm2 color names via `yaml_to_iterm_color_name_map`.

**JSON:** Use `.json` extension. No trailing commas, consistent formatting.

## Justfile Conventions

```justfile
# Constants use UPPER_SNAKE_CASE
SRC_PATH := "./src"
DIST_PATH := "./dist"

# Targets are lowercase with hyphens
build-target: dependency
    @silent_command  # @ suppresses command echoing
    echo "{{VARIABLE}}"  # Double braces for variable interpolation
```

## Python Package Management

Use `uv` for dependency management defined in `pyproject.toml`. All Python scripts must be run with `uv run`.

## File Encoding

All files use UTF-8 encoding. Explicitly specify `encoding="utf-8"` when reading/writing files.

## WCAG Accessibility

Terminal themes automatically adjust colors to meet WCAG contrast ratio threshold of 1.75. The `adjust_colors_for_wcag()` function modifies colors that don't meet accessibility requirements.

## Color System

Themes define colors as RGB values in `src/palette/` using placeholder names like `__ANSI_BLACK`, `__HIGH_EMPHASIS`, etc. These get substituted during the build process using `sed` on `.sed` files generated from palette JSONs.

## Jinja2 Templates

- Use `trim_blocks=True`, `lstrip_blocks=True`, `keep_trailing_newline=True`
- Access theme data via `scheme.to_dict()` which provides normalized color representations
- Templates are in `src/tools/templates/` and generate theme files for various terminal emulators

## No Tests

This project does not currently have test coverage. When implementing new features, test manually by running the appropriate build commands and verifying output in `dist/`.
