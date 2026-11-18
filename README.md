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

[Levers](https://leversmac.com) is a menu bar manager for Mac, a Bartender alternative: it hides the menu bar icons you choose and brings them back on a hover, a click or a hotkey, and ⌃⌥Space opens any of them from the keyboard. It also has one-click switches for Dark Mode, Night Shift, Do Not Disturb, Keep Awake, the Dock and more, modes that throw several at once, and Recording Mode, which clears the screen when you share or record it and puts it all back after. Every feature is free for three days; after that it needs a license key.

Levers updates itself too. To remove it and its data:

```sh
brew uninstall --zap --cask levers
```

## SoundBar

```sh
brew install --cask foredotstudio/tap/soundbar
```

[SoundBar](https://soundbarmac.com) is a volume mixer for Mac that lives in the notch and the menu bar: a slider from 0 to 200% for every app that plays sound, with mute, its own equalizer and balance, and its own output, so music can play on the speakers while a call goes to your AirPods. Every feature is free for three days; after that it needs a license key.

SoundBar updates itself too. To remove it and its data:

```sh
brew uninstall --zap --cask soundbar
```
