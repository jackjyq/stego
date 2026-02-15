# Agent Guidelines for tropical-theme

A VS Code theme project with Python tooling for generating color schemes across multiple terminals.

## Build Commands

```bash
# Build all themes
just build

# Build specific targets
just build-terminal      # Generate terminal schemes
just build-mac-terminal  # Generate Mac Terminal.app themes
just build-vscode        # Build VS Code extension (.vsix)
just install-opencode    # Install OpenCode themes locally

# Clean build artifacts
just clean

# Setup
just setup               # Create required directories
```

## Development Workflow

- Python 3.12+ required (managed via `uv`)
- Run scripts with: `uv run <script>`
- Dependencies managed in `pyproject.toml`
- Theme palettes defined in `src/palettes/*.yml`
- Templates in `src/templates/` (Jinja2 format)
- Generated themes output to `dist/`

## Code Style Guidelines

### Python

- **Type hints**: Use `from __future__ import annotations` and type all functions
- **Naming**: 
  - `snake_case` for variables, functions, modules
  - `PascalCase` for classes
  - `UPPER_CASE` for constants
- **Imports order**: stdlib → third-party → local, alphabetically within groups
- **Paths**: Always use `pathlib.Path` over string paths
- **Dataclasses**: Use `@dataclasses.dataclass(frozen=True)` for immutable data
- **Properties**: Use `@cached_property` for expensive computed values
- **Error output**: Write warnings/errors to `sys.stderr`
- **Docstrings**: Include module-level docstrings for CLI tools

### Templates

- Jinja2 templates in `src/templates/`
- Keep trailing newlines enabled
- Use `trim_blocks=True` and `lstrip_blocks=True`

### YAML Palettes

- Files in `src/palettes/*.yml`
- Required fields: `name`, color definitions
- Optional: `author`, `variant`
- Color format: hex (e.g., `#121212`)

## Project Structure

```
src/
  generate_schemes.py    # Main theme generator
  iterm2terminal.py      # Mac Terminal.app converter
  palettes/              # Color palette definitions (YAML)
  templates/             # Jinja2 templates for outputs
  static/                # Static assets
dist/                    # Generated theme outputs
```

## VS Code Extension

- Extension manifest: `package.json`
- Themes output to `dist/vscode/`
- Package with: `npx vsce package`
- Publish with: `just publish-vscode`

## Color Standards

- Dark background: `#121212`
- Light background: `#fafafa`
- WCAG contrast threshold: 1.75 (custom)
- sRGB color space standard (with P3→sRGB conversion support)

## Notes

- No test suite currently exists
- No linting/formatting tools configured (consider adding ruff/black)
- Project uses `uv` for fast Python package management
