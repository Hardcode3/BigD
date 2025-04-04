# VSCode Setup

## Login

Sign in using

1. Microsoft account
2. Github account (settings sync & supercharge git features)

## Editor font

Most fonts can be found on [google fonts](https://fonts.google.com/)

Favorites:

- [Cascadia Code](https://github.com/microsoft/cascadia-code)

### Nerd fonts

Nerd fonts are available [here](https://www.nerdfonts.com/font-downloads).

Favorites:

- ComicShannsMono Nerd Font
- 0xProto Nerd Font
- JetBrainsMono Nerd Font

## Extensions

- ✔️ means verified
- ⚠️ means unverified

### Git

- ✔️ `eamodio.gitlens`
- ⚠️ `mhutchie.git-graph`

### SSH Connections

- ✔️ `ms-vscode-remote.remote-ssh`

### Containers

- ✔️ `ms-azuretools.vscode-docker`
- ✔️ `ms-vscode-remote.remote-containers`

### Formatting

- ⚠️ `christian-kohler.path-intellisense`
- ⚠️ `esbenp.prettier-vscode`
- ⚠️ `njpwerner.autodocstring`

### C++

- ✔️ `ms-vscode.cpptools`
- ✔️ `ms-vscode.cpptools-extension-pack`

#### Build System

- ⚠️ `twxs.cmake`
- ✔️ `ms-vscode.cmake-tools`

### Python

- ✔️ `ms-python.vscode-pylance`
- ✔️ `ms-python.python`
- ✔️ `ms-python.debugpy`

#### Linting

- ✔️ `ms-python.pylint`
- ⚠️ `SonarSource.sonarlint-vscode`

### Markdownlint

- ⚠️ `DavidAnson.vscode-markdownlint`
- ⚠️ `yzane.markdown-pdf`
- ⚠️ `bierner.markdown-mermaid`

### Themes

- ⚠️ `PKief.material-icon-theme`
- ⚠️ `mechatroner.rainbow-csv`

## Settings

```json
{
  // Security
  "security.workspace.trust.untrustedFiles": "prompt",

  // Zoom
  "window.zoomLevel": 0.8,

  // Terminal
  "terminal.integrated.fontSize": 15,
  "terminal.integrated.fontLigatures.enabled": true,
  "terminal.integrated.defaultLocation": "editor",
  "terminal.integrated.cwd": "${workspaceFolder}",
  "terminal.integrated.defaultProfile.linux": "bash",
  "terminal.integrated.defaultProfile.windows": "Git Bash",

  // Editor
  "editor.minimap.enabled": false,
  "editor.formatOnPaste": false,
  "editor.formatOnType": false,
  "editor.formatOnSave": false,
  "editor.formatOnSaveMode": "modificationsIfAvailable",
  "editor.renderWhitespace": "trailing",
  "editor.occurrencesHighlight": "singleFile",
  "editor.suggest.insertMode": "replace",
  "editor.acceptSuggestionOnCommitCharacter": false,
  "editor.guides.bracketPairs": true,
  "editor.fontFamily": "'0xProto Nerd Font', Consolas, 'Courier New', monospace",
  "editor.fontLigatures": true,
  "editor.lineHeight": 1.5,
  "editor.fontSize": 15,
  "editor.mouseWheelZoom": true,
  "editor.pasteAs.preferences": [
        "markdown.link"
    ],

  // Files
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  "files.defaultLanguage": "markdown",
  "files.trimTrailingWhitespace": true,
  "files.exclude": {
    "**/.git": true,
    "**/.svn": true,
    "**/.hg": true,
    "**/CVS": true,
    "**/.DS_Store": true,
    "**/Thumbs.db": true
  },

  // Explorer related settings
  "explorer.autoReveal": false,
  "explorer.confirmDragAndDrop": false,
  "explorer.confirmDelete": true,

  // Workbench
  "workbench.tree.indent": 15,
  "workbench.editor.enablePreview": false,
  "workbench.iconTheme": "material-icon-theme",
  "workbench.colorTheme": "Solarized Light",
  "workbench.colorCustomizations": {
    "[Solarized Light]": {
      "editor.selectionBackground": "#f4f292"
    }
  },

  // Git
  "git.confirmSync": false,
  "git.enableSmartCommit": true,

  // Gitlens
  "gitlens.currentLine.enabled": false,
  "gitlens.codeLens.enabled": false,
  "gitlens.hovers.currentLine.over": "line",

  // Language specific settings
  "[python]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "python.analysis.autoFormatStrings": true,

  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  "[yaml]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  // Extensions
  "autoDocstring.docstringFormat": "google",

  // Disable Copilot Icon
  "chat.commandCenter.enabled": false
}

```

## Shortcuts

```json
{
  "shortcuts": [
    {
      "key": "ctrl+'",
      "command": "editor.action.smartSelect.expand",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+'",
      "command": "editor.action.addSelectionToNextFindMatch",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+x",
      "command": "editor.action.clipboardCutAction",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+d",
      "command": "editor.action.copyLinesDownAction",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+up",
      "command": "editor.action.moveLinesUpAction",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+down",
      "command": "editor.action.moveLinesDownAction",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+k",
      "command": "editor.action.deleteLines",
      "when": "editorTextFocus"
    },
    {
      "key": "alt+up",
      "command": "editor.action.insertLineBefore",
      "when": "editorTextFocus"
    },
    {
      "key": "alt+down",
      "command": "editor.action.insertLineAfter",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+o",
      "command": "workbench.action.quickOpen",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+o",
      "command": "revealFileInOS",
      "when": "editorTextFocus"
    },
    {
      "key": "ctrl+shift+l",
      "command": "workbench.action.showAllEditorsByMostRecentlyUsed"
    },
    {
      "key": "ctrl+shift+/",
      "command": "workbench.action.gotoSymbol"
    },
    {
      "key": "ctrl+n",
      "command": "explorer.newFile"
    },
    {
      "key": "ctrl+alt+l",
      "command": "editor.action.formatDocument"
    },
    {
      "key": "ctrl+t",
      "command": "workbench.action.terminal.toggleTerminal"
    },
    {
      "key": "ctrl+shift+t",
      "command": "workbench.action.terminal.new"
    }
  ]
}

```
