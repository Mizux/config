# Description
My custom config and dev note to codium (vscode OSS fork)

# Extensions
Installed in `~/.vscode-oss/extensions`
To list them: `code --list-extensions`
My extensions:
```
# Editor / Generic
GitHub.github-vscode-theme
PKief.material-icon-theme
vscodevim.vim

# CMake
ms-vscode.cmake-tools # CMake cmd integration
twxs.cmake # Syntax

# tools
ritwickdey.LiveServer

# Languages
esbenp.prettier-vscode
llvm-vs-code-extensions.vscode-clangd
ms-python.python
golang.go
redhat.java
Dart-Code.dart-code 
Dart-Code.flutter
ms-azuretools.vscode-docker
```

# Setting
Located in `~/.config/Code\ -\ OSS/User/settings.json` or `~/.config/Code/User/settings.json`

```json
{
    "workbench.preferredDarkColorTheme": "GitHub Dark Default",
    "workbench.colorTheme": "GitHub Dark Default",
    "workbench.iconTheme": "material-icon-theme",
    "material-icon-theme.hidesExplorerArrows": true,
    "material-icon-theme.activeIconPack": "vue_vuex"
}
```

# Troubleshooting
## Fixing VSX CORS error
There is temporary workaround:
* in the file `~/.vscode-oss/argv.json`
* add the line: `"enable-browser-code-loading": false`
* restart VSCodium

src: https://github.com/VSCodium/vscodium/issues/746#issuecomment-881049046
