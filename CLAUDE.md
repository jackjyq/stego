# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Stego Theme is a Visual Studio Code extension that provides two theme variants:
- **Stego Nightmare** - A dark theme (complete)
- **Stego Daydream** - A light theme (placeholder, uses same colors as Nightmare)

## Development Commands

### Running/Testing the Extension
- Press **F5** in VS Code to launch the extension development host and test theme changes live
- Or use `Run > Start Debugging` from the menu

### Publishing
- No build process is required - themes are pure JSON configuration
- Use `vsce package` to create a `.vsix` file for publishing to the VS Code Marketplace
- Requires `vsce` CLI tool: `npm install -g @vscode/vsce`

## Architecture

### Structure
```
package.json          # Extension manifest - registers themes in the contributes.themes section
themes/
  ├── stego-nightmare.json   # Dark theme (complete)
  └── stego-daydream.json    # Light theme (placeholder)
```

### Theme Definition Format
VS Code theme files are JSON with three main sections:

1. **colors** - UI component colors (workbench, editor, terminal, etc.)
2. **tokenColors** - Syntax highlighting rules with scope selectors
3. **semanticTokenColors** - Enhanced language support via semantic tokens

### Color Palette
The theme uses a specific palette defined in `stego-nightmare.json`:
- Background: `#121212`
- Primary text: `#ffffffde`
- Keywords (bold): `#e74c3c` (red)
- Strings: `#f1c40f` (yellow)
- Functions: `#2ecc71` (green)
- Types: `#2ecc71` (green)
- Support: `#3cc9d6` (cyan)
- Constants: `#6c71c4` (purple)

UI background shades:
- `#383838` - Title bar, status bar, activity bar
- `#282828` - Side bar, panel
- `#323232` - Active tabs, breadcrumbs
- `#262626` - Tab bar background, inactive tabs

## Important Notes

- Both theme files are currently **identical** - `stego-daydream.json` is a work-in-progress and needs a proper light theme implementation
- The `uiTheme` property in `package.json` determines the VS Code UI base (`vs-dark` vs `vs`)
- Theme changes are reflected immediately when F5 debugging session is active
- Comments in the JSON reference VS Code's theme color API documentation