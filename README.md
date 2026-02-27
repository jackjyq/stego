<div align="center">

<img src="./src/static/favicon/android-chrome-192x192.png" alt="Tropical Time Icon" width="192">

**Tropical Time | 热带时光**

A sensual, tropical-inspired color theme for developers.

专为开发者打造, 富有质感的热带风情主题

</div>

## 🚀 Quick Start

### VS Code

install directly from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=jackjyq.tropical-time) or search for `Tropical Time` in the Extensions view.

### OpenCode

download [OpenCode Themes](./dist/opencode/) into `~/.config/opencode/themes/`

### Vim

download [Vim Themes](./dist/vim/) into `~/.vim/colors/` and set `~/.vimrc` with:

```shell
:set termguicolors
:colorscheme Tropical-<Variant>
```

### Terminals

download theme for your terminals:

- [Windows Terminal](./dist/windowsterminal)
- [macOS Terminal](./dist/mac_terminal)
- [more...](./dist/)

### Wallpaper

download the [wallpaper](./src/static/wallpaper/) and set it as your desktop background to complete the tropical vibe.

## 🎨 [Color Palettes](https://harmonizer.evilmartians.com/#jZE9b8IwEIb_y3WNqnw5Cd4KSF1AlUqXqupwhMNENTZyHNoK5b9XRoXYGRD2do-f9-zzCY5k2kYr4EkEko4kW-AfJ1C4J-BQsTlEUGtlDbYWeMUiqHdG7xF4_BizSVay-LqSC5zhwfG0j65JxSipCJKSdFJUJbvh5yM_D_z0hsnYIjDZ3WY5Msu7zcnInISvzfJgbmGS6qTsPyPYdRT8xSttIAJUQhLwNPa6vRhUggbIfPhOUurvAVY-fDZEamBJ7sPZLyq_o8-msvMapoXPlihIWRxwFtz2qVuTEY3y_IzF7sUtWdso0QI_XWe31BuSwAEPtUvcNIZq22jl6sBhK970VMBlgP_VPf5ABGsx01KbRSN2Fjg8bNHtAczRfLl6krp9rp_PriwaCzxzHyi1WR2wdqGtEWvo-z8)

| Palettes                                                    | Description                         | 描述               |
| ----------------------------------------------------------- | ----------------------------------- | ------------------ |
| [Tropical Nightmare](./src/palettes/tropical_nightmare.yml) | vibrant and juicy dark theme        | 明艳饱满的暗黑主题 |
| [Tropical Daydream](./src/palettes/tropical_daydream.yml)   | graceful and paper-like light theme | 淡雅如纸的明亮主题 |

## 🛠️ Development

[![uv](https://img.shields.io/badge/uv-0.9%2B-purple)](https://docs.astral.sh/uv/)
[![Node.js](https://img.shields.io/badge/node.js-24%2B-green)](https://nodejs.org/en/)

```bash
# view available recipes
➜ just
```

## 💡 FAQ

<details>
<summary><strong>The color appears too harsh</strong></summary>

- adjust the monitor's lightness to a lower level
- enable the Eye Care Mode (or Night Shift) feature on your device.
</details>

<details>
<summary><strong>Color rendering is inconsistent in the terminal</strong></summary>

disable the bold text rendering feature in your terminal application:

- VSCode Integrated Terminal

```text
vscode://settings/terminal.integrated.drawBoldTextInBrightColors

Set the value to false
```

- Windows Terminal

```json
{
  "profiles": {
    "defaults": {
      "intenseTextStyle": "none"
    }
  }
}
```

</details>

## 🗺️ Roadmap

- [x] icon
- [x] wallpaper
- [x] VSCode theme
- [x] Vim theme
- [x] Terminal theme
- [x] OpenCode theme
- [ ] zed theme
- [ ] batcat theme

## 📄 License

this project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## 🙏 Acknowledgements

inspired by and built upon:

- [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes) - Terminal color scheme collection
- [GitHub VSCode Themes](https://github.com/primer/github-vscode-theme) - GitHub's official VS Code theme
- [Brogrammer Plus](https://github.com/jackjyq/vscode-theme-brogrammer-plus) - Brogrammer theme variant
