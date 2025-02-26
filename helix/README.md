# Install

Simply run the script `install.sh`

**Warning:** This script won't do any backup but simply overwrite any existing
config...

## Setup

edit config: `C-o`<br>
reload config: `C-r`

### Usage

TLDR: Operations and moves are reversed in Helix.
First select whatever text you want to operate on, and then use a modifying operation.
That makes things more consistent (Vim needs a separate x and d operation because of the operator -> move order, Helix only needs the d operation).
e.g.

delete a word:
* vim: `dw`
* helix: `wd`

copy a line:
* vim: `yy`
* helix: `xy`

Select a word:
* vim: `*`
* helix: `bw*` (or `*` with my custom config)

Nice to read:
* https://github.com/helix-editor/helix/wiki/Migrating-from-Vim
* https://docs.helix-editor.com/keymap.html

## Colorscheme

`:theme ...`

## Troubleshooting

Q: Copy/paste the clipboard using middle click is not working.
A: Install the package `xclip`.
