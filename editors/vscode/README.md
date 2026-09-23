# Description

My custom config and dev note to VSCodium/VSCode...

# Extensions

Installed in `~/.vscode-oss/extensions`
To list them: `code --list-extensions`

My extensions:

```
# Editor / Generic
GitHub.github-vscode-theme
PKief.material-icon-theme
vscodevim.vim

# Language

## C++
ms-vscode.cpptools
ms-vscode.cpptools-extension-pack
ms-vscode.cpptools-themes
ms-vscode.cmake-tools
twxs.cmake
llvm-vs-code-extensions.vscode-clangd
jeff-hykin.better-cpp-syntax

## Dart / Flutter
Dart-Code.dart-code
Dart-Code.flutter

## Golang
golang.go

## Java
redhat.java

## Python
ms-python.python

## Web
esbenp.prettier-vscode
ritwickdey.LiveServer
ms-azuretools.vscode-docker
```

# Setting

Located in `~/.config/Code\ -\ OSS/User/settings.json` or `~/.config/Code/User/settings.json`

e.g.
```json
{
    "workbench.preferredDarkColorTheme": "GitHub Dark Default",
    "workbench.colorTheme": "GitHub Dark Default",
    "workbench.iconTheme": "material-icon-theme",
    "material-icon-theme.hidesExplorerArrows": true,
    "material-icon-theme.activeIconPack": "vue_vuex"
    "vim.handleKeys": {
        "<C-b>": false,
        "<C-j>": false,
        "<C-d>": true,
        "<C-s>": false,
        "<C-z>": false,
    },
}
```

# Key bindings

Located in `~/.config/Code/User/keybinding.json`

e.g.
```json
// Place your key bindings in this file to override the defaultsauto[]
[
    {
        "key": "ctrl+t",
        "command": "workbench.action.toogleAuxiliaryBar"
    },
]
```

# Troubleshooting
## Fixing VSX CORS error

There is temporary workaround:
* in the file `~/.vscode-oss/argv.json`
* add the line: `"enable-browser-code-loading": false`
* restart VSCodium

src: https://github.com/VSCodium/vscodium/issues/746#issuecomment-881049046
