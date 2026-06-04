# homebrew-tap

Homebrew tap for [csthink](https://github.com/csthink)'s command-line tools.

## Tools

| Formula | What it is | Platforms |
|---|---|---|
| [llmkeys](https://github.com/csthink/llmkeys) | macOS credential & config manager for LLM providers — keys via keychain/Bitwarden, config stores only references | macOS (Apple Silicon + Intel) |
| [llmlore](https://github.com/csthink/llmlore) | Discover and curate LLM/agent learning repositories from a local HTML dashboard | macOS + Linux (amd64 + arm64) |

## Install

```sh
brew install csthink/tap/<tool>
```

For example:

```sh
brew install csthink/tap/llmkeys
brew install csthink/tap/llmlore
```

`csthink/tap/<tool>` is shorthand for `brew tap csthink/tap && brew install <tool>`.

## Upgrade

```sh
brew upgrade <tool>
```
