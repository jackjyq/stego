<div align="center">

<img src="./src/static/favicon/android-chrome-192x192.png" alt="Tropical Time Icon" width="192">

# Tropical Time ｜ 热带时光

A sensual, tropical-inspired color theme for developers.

专为开发者打造, 富有质感的热带风情主题

</div>

## 🚀 Quick Start


### Editors

- [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=jackjyq.tropical-time)
- [OpenCode](./dist/opencode/)
- [Vim](./dist/vim/)

### Terminals

- [Windows Terminal](./dist/windowsterminal)
- [macOS Terminal](./dist/mac_terminal)
- [more...](./dist/)

### Artworks

- [Icon](./src/static/favicon/)
- [Wallpaper](./src/static/wallpaper/)

## 🎨 Color Design

### Palettes

- [Nightmare & Daydream Palette](https://harmonizer.evilmartians.com/#jZE9b8IwEIb_y3WNqnw5Cd4KSF1AlUqXqupwhMNENTZyHNoK5b9XRoXYGRD2do-f9-zzCY5k2kYr4EkEko4kW-AfJ1C4J-BQsTlEUGtlDbYWeMUiqHdG7xF4_BizSVay-LqSC5zhwfG0j65JxSipCJKSdFJUJbvh5yM_D_z0hsnYIjDZ3WY5Msu7zcnInISvzfJgbmGS6qTsPyPYdRT8xSttIAJUQhLwNPa6vRhUggbIfPhOUurvAVY-fDZEamBJ7sPZLyq_o8-msvMapoXPlihIWRxwFtz2qVuTEY3y_IzF7sUtWdso0QI_XWe31BuSwAEPtUvcNIZq22jl6sBhK970VMBlgP_VPf5ABGsx01KbRSN2Fjg8bNHtAczRfLl6krp9rp_PriwaCzxzHyi1WR2wdqGtEWvo-z8)
- [Morninglight & Twilight Palette](https://harmonizer.evilmartians.com/#jZFBb8IgFMe_y9uVLJSKttymS3aZWTJ3McsOWF-xGYKh1G0x_e4LZrPQg5Hj-73_7_HgBEd0bWMNiIyAxiPqFsT7CYzcIwgo-BwIVNZ4J1sPouAEqp2zewmC3lNe5jNOLyf7hwt5CJz15GKajkzTxJSxImORiV0xTUamSWK6luR8nST5zcnZKDm7OVmOkmW6d54unicm02ndfxDYdZj8yitugYA0SiMIRqNpL04ahQPkMVyj1vZrgEUMnxyiGVg2ieHiR5p4YszmuosGsmnMllKh8XLAeXLbh26DTjUmyuecho1b9L4xqgVxurzd0m5RgwB5qIJx2zisfGNNqIOAWr3ZuYL_B_yr7uU3ENiohdXWPTdq50HAXV3XZZ0N4FG6z1CnlNY5O9fPvSsvnQcRfiW0rQ6yCtLWqQ30_S8)

### Themes

| Palettes                                                    | Description                         | 描述               |
| ----------------------------------------------------------- | ----------------------------------- | ------------------ |
| [Tropical Morninglight](./src/palettes/tropical_morninglight.yml) | fresh and golden light theme | 清亮柔和的淡金主题 |
| [Tropical Daydream](./src/palettes/tropical_daydream.yml)   | graceful and paper-like light theme | 淡雅如纸的白昼主题 |
| [Tropical Twilight](./src/palettes/tropical_twilight.yml) | ethereal and deep blue dark theme          | 空灵深邃的深蓝主题 |
| [Tropical Nightmare](./src/palettes/tropical_nightmare.yml) | vibrant and juicy dark theme        | 明艳饱满的暗夜主题 |

## 🛠️ Development

[![uv](https://img.shields.io/badge/uv-0.9%2B-purple)](https://docs.astral.sh/uv/)
[![Node.js](https://img.shields.io/badge/node.js-24%2B-green)](https://nodejs.org/en/)
[![just](https://img.shields.io/badge/just-1.34%2B-red)](https://github.com/casey/just)

After install the above dependencies, run `just` to view available recipes.

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

```json
{
  "terminal.integrated.drawBoldTextInBrightColors": false,
  "terminal.integrated.fontWeightBold": "normal"
}
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

<details>
<summary><strong>Features</strong></summary>

- [x] dark palette
- [x] light palette
- [x] icon
- [x] wallpaper
- [x] VSCode theme
- [x] Vim theme
- [x] Terminal theme
- [x] OpenCode theme
- [x] dark variant palette
- [x] light variant palette
- [ ] zed theme
- [ ] batcat theme

</details>

## 📄 License

this project is licensed under the [MIT License](LICENSE.txt).

## 🙏 Acknowledgements

<details>
<summary><strong>Inspired by and built upon</strong></summary>

- [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes) - Terminal color scheme collection
- [GitHub VSCode Themes](https://github.com/primer/github-vscode-theme) - GitHub's official VS Code theme
- [Brogrammer Plus](https://github.com/jackjyq/vscode-theme-brogrammer-plus) - Brogrammer theme variant

</details>