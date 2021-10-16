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

<table>
<th>Windows</th>
<th>Macos</th>
<th>Linux</th>
<tr align="center">
<td>✅ Yes</td>
<td>✅ Yes</td>
<td>❔</td>
</tr>
<tr align="center">
<td><sup>*requires <a href="https://git-scm.com/downloads">Git / Git Bash</a></sup></td>
<td></td>
<td><sup>*should work, but not tested</sup></td>
</tr>
</table>

| Windows              | Macos  | Linux |
| -------------------- | ------ | ----- |
| ✅ Yes<sup>[1]</sup> | ✅ Yes | ❔    |

[1]: Windows requires [Git & Git Bash](https://git-scm.com/downloads)
