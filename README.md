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

- Add Gitalk intergration.
- Tag & category page appending more easily.
- Customizable color scheme. (Some bug in original version, fixed.)
- Firefox-friendly. (CSS issue in original version, fixed.)
- `featured_image` url bug is fixed.
- Table of Contents with scroll spy.


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

Please visit [the project wiki](https://github.com/amazingrise/hugo-theme-diary/wiki) for details.

### Example config

See [/exampleSite/config.toml](https://github.com/AmazingRise/hugo-theme-diary/blob/master/exampleSite/config.toml)

### Customization

[Change color scheme](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#change-color-scheme)

[Change font scheme](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#change-default-font-scheme)

[Customize sidebar](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#customize-sidebar)

[Disable Table of Contents](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#disable-table-of-contents)

[Add or disable comment area](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#add-comment-area)

[Add Google Analytics and Site Verification](https://github.com/AmazingRise/hugo-theme-diary/wiki/Customization#add-google-analytics)

### Other Details

[Taxonomies and Sections (Archive, Categories and Tags)](https://github.com/AmazingRise/hugo-theme-diary/wiki/Taxonomies-and-Sections-(Archive,-Categories-and-Tags))

[RSS Feed](https://github.com/AmazingRise/hugo-theme-diary/wiki/RSS-Feed)

[Meta Data of posts](https://github.com/AmazingRise/hugo-theme-diary/wiki/Post's-meta-data)

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