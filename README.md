# HHI Gallery Website

This website is built with [Hugo](https://gohugo.io/) and uses the [Gallery](https://themes.gohugo.io/themes/hugo-theme-gallery/) theme. However, the homepage has been entirely redesigned and customized. See below for details.

## Did you update git submodules?

```sh
git submodule init
git submodule update
```

## How to edit the homepage

The text of the homepage is in `content/_index.md`, but the HTML is in `layouts/_default/homepage.html`. The CSS is in `css/custom.css`.

## How to edit the contacts

The data for the contact information is in `hugo.toml`. This is probably where you would need to make changes.

The HTML template to generate the list is `layouts/shortcodes/contact_list.html`.

## How to add new photos

Create a directory `content/new-thing` and put image files in there. Create `content/new-thing/index.md` in order to give it a title, control the sort order of images in the album, and control the sort order of all the albums on the gallery page.

Feel free to copy an existing example.

## Sorting albums in the gallery

The "toplevel" `weight` parameter controls this:

```yaml
---
title: EV charger installation on a brick wall
weight: 110     # <-- THIS ONE
sort_by: Params.weight
resources:
  - src: brick2-work-3.jpeg
    params:
      weight: 0
  - src: brick2-work-5.jpeg
    params:
      weight: 1
  - src: brick2-work-1.jpeg
    params:
      weight: 2
      cover: true
---
```

The current albums are spaced with weights 10 apart, so that there is room to add stuff in between.

## Sorting images inside an album

The "inner" `weight` parameters control this:

```yaml
---
title: EV charger installation on a brick wall
weight: 110
sort_by: Params.weight
resources:
  - src: brick2-work-3.jpeg
    params:
      weight: 0     # <-- THIS ONE
  - src: brick2-work-5.jpeg
    params:
      weight: 1     # <-- THIS ONE
  - src: brick2-work-1.jpeg
    params:
      weight: 2     # <-- THIS ONE
      cover: true
---
```

## Why does each layout customization exist?

### `layouts/_default/homepage.html`

This is the template for the actual homepage. It works in conjunction with the Markdown text in `content/_index.md`.

It contains the main "galleries" section copied from the theme's `home.html`.

### `layouts/_default/header.html`

This was originally copied from the theme's version, but it has been modified to never show a hamburger menu, and it only displays on gallery album pages (where it shows a "<-" back button) and doesn't display on the homepage.

This is the root of the HTML document. It was copied from the theme's version, but the header is only displayed if 

### `layouts/partials/footer.html`

The footer has been completely redone in order to add contact icons and the company name.

### `layouts/partials/head-custom.html`

This loads custom CSS, ForkAwesome icons, and custom fonts. It also contains additional favicon metadata.

### `layouts/shortcodes/contact_list.html`

This generates the list inside the "contact us" page.
