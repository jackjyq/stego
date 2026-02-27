<div align="center">

<img src="./src/static/favicon/apple-touch-icon.png" alt="Tropical Time Icon" width="100">

**Tropical Time | 热带时光**

A sensual, tropical-inspired color theme for developers.

专为开发者打造, 富有质感的热带风情主题

</div>


## 🎨 Color Palettes

| Theme | Description |
|-------|-------------|
| [Tropical Nightmare](./src/palettes/tropical_nightmare.yml) | vibrant and juicy dark theme / 明艳饱满的暗黑主题 |
| [Tropical Daydream](./src/palettes/tropical_daydream.yml) | graceful and paper-like light theme / 淡雅如纸的明亮主题 |

## 🚀 Quick Start

### VS Code

install directly from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=jackjyq.tropical-time) or search for `Tropical Time` in the Extensions view.

### OpenCode

download [OpenCode Themes](./dist/opencode/) into `~/.config/opencode/themes/`

### Terminals

download theme for your terminals:

- [Windows Terminal](./dist/windowsterminal)
- [macOS Terminal](./dist/mac_terminal)
- [more...](./dist/)

### Wallpaper

download the [wallpaper](./src/static/wallpaper/) and set it as your desktop background to complete the tropical vibe.

## 💡 FAQ

### The color appears oversaturated

- adjust the monitor's lightness to a lower level
- enable the Eye Care Mode (or Night Light/Night Shift) feature on your display.

### Color rendering is inconsistent in the terminal

disable the bold text rendering feature in your terminal application:

**VSCode Integrated Terminal**

```text
vscode://settings/terminal.integrated.drawBoldTextInBrightColors

Set the value to false
```

**Windows Terminal**

```json
{
  "profiles": {
    "defaults": {
      "intenseTextStyle": "none"
    }
  }
}
```

## 🛠️ Development

[![uv](https://img.shields.io/badge/uv-0.9%2B-purple)](https://docs.astral.sh/uv/)
[![Node.js](https://img.shields.io/badge/node.js-24%2B-green)](https://nodejs.org/en/)

```bash
# view available recipes
➜ just
```

## 📄 License

this project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## 🙏 Acknowledgements

inspired by and built upon:

- [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes) - Terminal color scheme collection
- [GitHub VSCode Themes](https://github.com/primer/github-vscode-theme) - GitHub's official VS Code theme
- [Brogrammer Plus](https://github.com/jackjyq/vscode-theme-brogrammer-plus) - Brogrammer theme variant
