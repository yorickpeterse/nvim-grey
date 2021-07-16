# Grey

A low-contrast theme for NeoVim, based on
[vim-paper](https://gitlab.com/yorickpeterse/vim-paper). Paper was the first
light theme I used/created after years of using dark themes. The rationale for
that was as follows:

> I created Paper as a replacement for [Happy
> Hacking](https://gitlab.com/yorickpeterse/happy_hacking.vim), and the
> [Autumn](https://gitlab.com/yorickpeterse/Autumn.vim) theme it was originally
> based on. I've been using dark themes for the last decade or so, and mostly
> without issues. But dark themes are not necessarily a good choice for your eyes,
> and research has shown that it's generally better to have dark text on a light
> background (see [this StackExchange question for some interesting
> data](https://ux.stackexchange.com/questions/53264/dark-or-white-color-theme-is-better-for-the-eyes)).
> In addition, [halation](https://en.wiktionary.org/wiki/halation) becomes a
> problem when presenting light text on (very) dark backgrounds.
>
> Besides the issues with dark themes, I also simply wanted a theme with fewer
> colors; making the colors that _are_ used stand out more. I couldn't squeeze
> this into the Happy Hacking theme without fundamentally changing it, so I
> created a new theme instead.

Grey is a continuation of the goal of making a light theme that's easy on the
eyes, and not distracting by introducing many colors. The most notable
difference compared to Paper is that the main background color is a light grey,
instead of a light yellow color. Hence the (incredibly creative) name.

Like Paper, this theme is best used on a low brightness display, with a color
temperature of <5500K. During the day I use a color temperature of 5200K, while
at night the temperature is set to 3800K. This theme probably won't look so good
when using the common display temperature of 6500K.

## Screenshots

**Ruby**:

![Ruby](screenshots/ruby.png)

**Rust**:

![Rust](screenshots/rust.png)

**Lua**:

![Lua](screenshots/lua.png)

**SQL**:

![SQL](screenshots/sql.png)

**NeoVim terminal**:

![Terminal](screenshots/terminal.png)

## Terminal colors

If you want to use Paper as your terminal theme, you can use the following color
palette:

| Color   | Normal    | Bright    | GNOME Terminal color index
|:--------|:----------|:----------|:--------------------------
| Black   | `#000000` | `#555555` | 0, 8
| Red     | `#CC3E28` | `#CC3E28` | 1, 9
| Green   | `#216609` | `#216609` | 2, 10
| Yellow  | `#BF8F00` | `#BF8F00` | 3, 11
| Blue    | `#1E6FCC` | `#1E6FCC` | 4, 12
| Purple  | `#5C21A5` | `#5C21A5` | 5, 13
| Cyan    | `#158C86` | `#158C86` | 6, 14
| White   | `#FFFFFF` | `#AAAAAA` | 7, 15

For the text and highlight/selection color:

| Color     | Foreground | Background
|:----------|:-----------|:------------
| Text      | `#000000`  | `#F2F2F2`
| Highlight | `#000000`  | `#DDDDDD`

## Requirements

* NeoVim
* true-color support

Support for regular Vim isn't planned. Once NeoVim provides a stable API for
defining highlight groups (that doesn't involve just running the `hi` command),
we plan to use Lua for the theme.

## Installation

### Vim Plug

    Plug 'https://gitlab.com/yorickpeterse/nvim-grey.git'

## License

All source code in this repository is licensed under the Mozilla Public License
version 2.0, unless stated otherwise. A copy of this license can be found in the
file "LICENSE".
