# [setup.sh - opinionated environment settings for Bash](https://github.com/jerrygreen/setup.sh)

The idea is to have some shared rc files across systems, easily updatable.

## Install / Usage

```bash
curl -sL https://x.jerrygreen.me/setup.sh | bash
```

This will create:

- [`~/bin`](https://github.com/jerrygreen/setup.sh/tree/master/bin) folder, with some useful functions accessible as commands in bash
- [`~/.rc`](https://github.com/jerrygreen/setup.sh/tree/master/rc) folder, with files for your OS, which are applied automatically for every bash login.

Note: [`rc-once`](https://github.com/jerrygreen/setup.sh/tree/master/.rc-once) folder isn't copied to your system: those settings are set only during installation!

## Update

To update, - just run this script again. This command can be quickly searched by typing <kbd>Ctrl+R</kbd> -> `setup.sh`.

## Supported Platforms

| Windows              | Macos  | Linux |
| -------------------- | ------ | ----- |
| ✅ Yes<sup>[1]</sup> | ✅ Yes | ❔    |

[1]: Windows requires [Git & Git Bash](https://git-scm.com/downloads)
