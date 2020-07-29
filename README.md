# hugo-theme-diary
![](https://img.shields.io/badge/license-MIT-blue.svg)

隻言片語・於此匯聚

Moments piled up.

A Hugo theme ported from [SumiMakito/hexo-theme-Journal](https://github.com/SumiMakito/hexo-theme-Journal/).

## Links

**Some useful links here:**

[Live Demo](https://amazingrise.net/)

[Intro Video](https://www.bilibili.com/video/av84273002)

[Changelog (Progress and TODO List)](https://github.com/AmazingRise/hugo-theme-diary/projects/)

[Project Wiki](https://github.com/amazingrise/hugo-theme-diary/wiki)

Original Author: [SumiMakito](https://github.com/SumiMakito)


## Features

Features in the ori.:

- Simple and easy to customize
- Concentrated on reading <del>and writing (find a Markdown editor then)</del> experience
- Mobile-friendly & widescreen-friendly
- Flexible commenting control

Features in this ported version:

- Add Gitalk and Valine intergration.
- Customizable color scheme. (Some bug in original version, fixed.)
- Firefox-friendly. (CSS issue in original version, fixed.)
- `featured_image` url bug is fixed.
- Table of Contents with scroll spy and auto collapse.
- Dark mode.
- MathJax support. (Needs to be enabled manually, see [the project wiki](https://github.com/amazingrise/hugo-theme-diary/wiki) for details.)
- Google Custom Search Engine support.
- Internationalization(i18n) support, with English, French and Chinese(Simplified and Traditional).
- Inserting figures more easily, see [wiki](https://github.com/AmazingRise/hugo-theme-diary/wiki/Inserting-Figures) for details.

## Quick Start

If your website is using Git as version control, please do as follows:

1. Fetch the theme dir.

From the root of your Hugo site, open the terminal and execute:
```bash
git submodule add https://github.com/AmazingRise/hugo-theme-diary.git themes/diary
```
2. Update git repository.

Then update the git repository from the root of your site:
```bash
git submodule update --remote --merge
```

3. Run example site.

From the root of themes/diary/exampleSite:
```bash
hugo server --themesDir ../..
```
## Personalization

### Example config

See [/exampleSite/config.toml](https://github.com/AmazingRise/hugo-theme-diary/blob/master/exampleSite/config.toml)

### Customization

Please visit [the project wiki](https://github.com/amazingrise/hugo-theme-diary/wiki) for more details.

[Settings of Table of Contents](https://github.com/AmazingRise/hugo-theme-diary/wiki/Table-Of-Contents)

[Disable Dark Mode](https://github.com/AmazingRise/hugo-theme-diary/wiki/Dark-Mode)

[Enable MathJax](https://github.com/AmazingRise/hugo-theme-diary/wiki/MathJax)

[Add or disable comment area](https://github.com/AmazingRise/hugo-theme-diary/wiki/Comment-Area)

[Add Google Search Box on your site](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#add-google-search-box-on-your-site)

[Customizations](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization)

[Taxonomies and Sections (Archive, Categories and Tags)](https://github.com/AmazingRise/hugo-theme-diary/wiki/Taxonomies-and-Sections-(Archive,-Categories-and-Tags))

[RSS Feed](https://github.com/AmazingRise/hugo-theme-diary/wiki/RSS-Feed)

[Meta Data of posts](https://github.com/AmazingRise/hugo-theme-diary/wiki/Post's-meta-data)

[Enable Reading Time](https://github.com/AmazingRise/hugo-theme-diary/wiki/Reading-Time)

[Internationalization](https://github.com/AmazingRise/hugo-theme-diary/wiki/Internationalization)

## Comparison

For details about the difference lies in the new version, please click [here.](https://github.com/AmazingRise/hugo-theme-diary/wiki/Comparison)

## Screenshots

Site Main Page

![](https://raw.githubusercontent.com/AmazingRise/hugo-theme-diary/master/images/tn.png)

An essay with picture.

![](https://raw.githubusercontent.com/AmazingRise/hugo-theme-diary/master/images/essay.png)

Table of Contents with scroll spy.

![](https://raw.githubusercontent.com/AmazingRise/hugo-theme-diary/master/images/essay2.png)

Mobile View: Main Page

![](https://raw.githubusercontent.com/AmazingRise/hugo-theme-diary/master/images/m_main.png)

Mobile View: Drawer

![](https://raw.githubusercontent.com/AmazingRise/hugo-theme-diary/master/images/m_drawer.png)