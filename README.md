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
- [Wallpaper for E-ink](./src/static/wallpaper-eink/)

## 🎨 Color Design

### Palettes

- [Nightmare & Daydream Palette](https://harmonizer.evilmartians.com/#jZI9b8IwEIb_y3WNqnw5Id4KSF1ArQpLVXUw4TARjh05Di1C_PfKqMAlA8Le7snz2rnzEfZo28po4FEACveoWuBfR9CiRuAwYlMIoDTaWdE64CMWQLm1phbAw-eQFUnOwuuKLnAiGs_jU3BNygZJWS8piotslLM7fjrw054f3zEZm_VM9rCZD8z8YbMYmEX_b5O017d-ku6UOn0HsO2wN4sPXEMAQkuFwOOQnPZmhZZ4g4zCT1TK_NzgiMJZVRMviih7tYiawJTCJQpFWE7Z5CA0vSlli92BoISiserIXeKMsvfONorSgtK5kKiduOGk156XboVWVpr4CQt9i1t0rtKyBX68Dmtu1qiAg2hKn7iuLJauMtrXgcNGLs1YwmVi_9Va_EIAKzkxythZJbcOODxthN83MBV25-tR7Pe5fv524YR1wBP_YpSxi0aUPrS1cgWn0x8)
- [Morninglight & Twilight Palette](https://harmonizer.evilmartians.com/#jZI9b8IwEIb_y3WNqnxgkngrVOoCalVYUNXBhIuJcOzIcWgRyn-vggq5ZEB4vMfv47PPZziirQujgQceKDyiqoF_nUGLEoFDwmbgQWa0s6J2wBPmQba3phTA_WefpVHM_NsKrnAuqo6HrXczTUem6cAUhEkQElN4xzQZmSYD070kY5tBkj2cjEfJ-OFkOkqmw3tHw4tHA5NulGq_Pdg3OJjKJ-7AA6GlQuChT057t0JL7CGjcINKmZ8eJhQuipLkgoCyN4uoCZxQuEahCIspm5-Epp1StjqcCIoomqmG9BJOKftobKUoTSldConaiR5Hg-d5abZoZaFJPmJ-98Q1OldoWQM_34a1NDtUwEFUWWfcFRYzVxjd1YFDLtdmJuE6sf9qKX7Bg62cG2XsopB7Bxye8jxP86AHr8Ieurrv-3kUXuqXvSsnrAPefYNu26oSWSetrdxC2_4B)
- [E-ink Grey Scale](https://huetone.ardov.me/?palette=N4IgdghgtgpiBcICiBLMBrEAaEALArjAM4IDaoksCIADNiAMYD2ANkwE4nykgDENAwSAC6AXywVocRAEZ6zNpzJ8ZqtSPGSqiAEzzWHLj147TZjRPBTqAZn2KjfG85cWt0kABZ7h5b08BgW5W2iAArD5K3HxhsXHBlB4AbJGOvEkZmQnWiADsqX65RcXZoQAcBdG8ZTW1pR4AnJXGDa1t9dQAgs18EH39HYgAQj28AEYTk4MgAMKjDAuL0wAiowAmG5vTSKMwe-vTAGKjAGZn5xrCOAAuTGDEygDi7DAAnhpAA)

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