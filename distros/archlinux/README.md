# DejaVuSansMono Nerd Fonts

For manual install (e.g. gLinux)
You can dl Nerd Fonts from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono/Regular

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/DejaVuSansMono/Regular/DejaVuSansMNerdFont-Regular.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/DejaVuSansMono/Regular/DejaVuSansMNerdFontMono-Regular.ttf
wget https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/patched-fonts/DejaVuSansMono/Regular/DejaVuSansMNerdFontPropo-Regular.ttf
```

then to update fonts cache, you can run: 
```sh
fc-cache -fv
```
