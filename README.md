# Wenzlik Homebrew tap

Homebrew casks for apps by Václav Zmrhal.

## QuotaVadis

Menu bar app showing Claude Code, Codex, Cursor and Gemini usage limits. https://zmrhal.cz/quotavadis/

```sh
brew install --cask wenzlik/tap/quotavadis
```

The app updates itself via Sparkle (`auto_updates true`), so `brew upgrade` skips it unless you pass `--greedy`.
The cask also links the bundled CLI as `quotavadis`.
