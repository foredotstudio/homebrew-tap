# Fore Studio's Homebrew tap

```sh
brew install --cask foredotstudio/tap/vitals
```

[Vitals](https://vitalsmac.com) is an Activity Monitor alternative for Mac: 60 apps instead of 1,000 processes, up to a year of history, the coding agents you run and what is left of your AI plans, in a window and the menu bar.

The cask installs the app and links its `vitals` command, with its manual page (`man vitals`) and tab completion for zsh, bash and fish. The command answers from the running app: open Vitals, then turn on Settings → Integrations → Let AI Assistants Ask Vitals.

```sh
vitals status          # CPU, memory, disk, network, battery, heat
vitals top cpu day     # what used the most CPU today
vitals ports           # what is listening, and whether it's open to the network
vitals agents          # coding agents running and what they started
vitals limits          # what is left of each AI plan
```

Vitals updates itself, so `brew upgrade` leaves it alone. To remove it and its data:

```sh
brew uninstall --zap --cask vitals
```

## Levers

```sh
brew install --cask foredotstudio/tap/levers
```

[Levers](https://leversmac.com) is a Mac menu bar app that hides your desktop icons, the Dock, other apps and menu bar icons before you record or share your screen, and puts everything back with one click. It needs a license key to turn things on.

Levers updates itself too. To remove it and its data:

```sh
brew uninstall --zap --cask levers
```
