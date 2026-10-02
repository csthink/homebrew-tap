# homebrew-tap

Homebrew tap for [csthink](https://github.com/csthink)'s command-line tools and desktop apps.

## Tools

| Formula | What it is | Platforms |
|---|---|---|
| [envcue](https://github.com/csthink/envcue) | Per-terminal shell environment scene switcher — menu-bar visibility, secrets in Keychain, never touches PATH | macOS (Tahoe 26+) |
| [llmkeys](https://github.com/csthink/llmkeys) | macOS credential & config manager for LLM providers — keys via keychain/Bitwarden, config stores only references | macOS (Apple Silicon + Intel) |
| [llmlore](https://github.com/csthink/llmlore) | Discover and curate LLM/agent learning repositories from a local HTML dashboard | macOS + Linux (amd64 + arm64) |

## Desktop apps

| Cask | What it is | Platforms |
|---|---|---|
| [qingluan](https://github.com/csthink/mars-assistant-mac) | 青鸾 (Qingluan), a desktop assistant and workbench | macOS 26.6.2 or later (Apple Silicon) |

```sh
brew install --cask csthink/tap/qingluan
```

青鸾 (Qingluan) is ad-hoc signed and not notarized by Apple. If macOS blocks the first launch:
System Settings → Privacy & Security → Open Anyway. Do not turn off Gatekeeper.
`brew uninstall --zap --cask qingluan` also removes its data.

## Install

```sh
brew install csthink/tap/<tool>
```

For example:

```sh
brew install csthink/tap/envcue
brew install csthink/tap/llmkeys
brew install csthink/tap/llmlore
```

`csthink/tap/<tool>` is shorthand for `brew tap csthink/tap && brew install <tool>`.

## Upgrade

```sh
brew upgrade <tool>
brew upgrade --cask qingluan
```
