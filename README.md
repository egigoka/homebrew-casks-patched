# homebrew-casks-patched

Personal Homebrew tap for patched casks.

## Usage

```sh
brew tap egigoka/casks-patched
brew install egigoka/casks-patched/gping-patched
brew install --cask --force egigoka/casks-patched/dockdoor-patched
```

`gping-patched` tracks the patched fork's latest `master`. Scheduled workflows
sync that fork from upstream and update this formula daily.

`--force` may be needed because Homebrew treats third-party cask taps as untrusted.
