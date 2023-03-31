# Dotfiles

## VM.SH

Install zsh | git | vim | tmux on new VM. Script has written by GPT-4

Setup `vm.sh` on your VM

Install all:
```sh
curl -fsSL https://raw.githubusercontent.com/tmshv/dotfiles/master/vm.sh | bash
```

Install only what you need
```sh
curl -fsSL https://raw.githubusercontent.com/tmshv/dotfiles/master/vm.sh | bash -s -- zsh git vim tmux
```

## Firefox

Show tab bar in fullscreen mode

- [about:config](about:config)
- `browser.fullscreen.autohide` to `false`
