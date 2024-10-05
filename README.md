# setup.sh - opinionated shell settings by jerrygreen

The idea is to have some shared rc files across different devices and systems, easily updatable.
Made specifically to cover my issues with the environment. Might not fit for you.

## Requirements

- [NodeJS](https://nodejs.org) v18.19.1
- [nushell](https://www.nushell.sh) v0.92.1
- [zoxide](https://github.com/ajeetdsouza/zoxide) v0.9.4
- [fzf](https://github.com/junegunn/fzf) v0.49.0

## Install / Usage

```bash
curl -sL https://raw.github.com/jerrygreen/setup.sh/master/setup.js | node
```

This will create:

<!-- - [`~/bin`](https://github.com/jerrygreen/setup.sh/tree/master/bin) folder, with some useful functions accessible as commands in bash -->
- [`~/.rc`](https://github.com/jerrygreen/setup.sh/tree/master/rc) folder, which are applied automatically for every nushell login.

<!-- Note: [`rc-once`](https://github.com/jerrygreen/setup.sh/tree/master/.rc-once) folder isn't copied to your system: those settings are set only during installation! -->

## Update

To update, - just run this script again. This command can be quickly searched by typing <kbd>Ctrl+R</kbd> -> `setup.js`.

## Supported Platforms

| Windows              | Macos  | Linux |
| -------------------- | ------ | ----- |
| ✅ Yes<sup>[1]</sup> | ✅     | ❔    |

[1]: Windows requires [Git & Git Bash](https://git-scm.com/downloads)
