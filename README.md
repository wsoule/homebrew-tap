# Wyat Soule's Homebrew Tap

```sh
brew tap wsoule/tap
```

## Casks

### query

A modern SQL database client with IntelliSense, schema browsing, and git-friendly saved queries. Signed + notarized for macOS.

```sh
brew install --cask wsoule/tap/query
```

Source: <https://github.com/wsoule/Query>

### write-md

A dead-simple Markdown writing app for macOS. One window, one column of text, and nothing else in the way. Universal, signed and notarized.

```sh
brew install --cask wsoule/tap/write-md
```

Source: <https://github.com/wsoule/Write>

## Formulae

### linear-tui

Keyboard-first Linear client for the terminal.

```sh
brew install oven-sh/bun/bun
brew install wsoule/tap/linear-tui
```

`linear-tui` requires a Linear personal API key:

```sh
export LINEAR_API_KEY=lin_api_...
linear-tui
```

Create a key from Linear's API settings page:
<https://linear.app/settings/account/security>

### fuck

Typed a command wrong? Say `fuck`. Jev picks the one you meant from your zsh history.

```sh
brew install wsoule/tap/fuck
```

Add to `~/.zshrc`:

```sh
export TYPESAFE_API_KEY=...
eval "$(fuck --alias)"
```

Source: <https://github.com/wsoule/fuck>

### Other formulae

- **stack** — stacked-branch workflow for atomic commits
- **jjd** — Jujutsu automation daemon
- **dotfiles** — personal dotfiles bootstrap
- **st** — minimal terminal helper
