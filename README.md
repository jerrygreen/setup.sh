# [setup.sh - opinionated environment settings for Bash](https://github.com/jerrygreen/setup.sh)

The idea is to have some shared rc files across systems, easily updatable.

## Install / Usage

```bash
curl -sL https://x.jerrygreen.me/setup.sh | bash
```

This will create [`~/.rc`](https://github.com/jerrygreen/setup.sh/tree/master/.rc) folder with opinionated environmental settings, which are applied automatically.

To update, - just run this script again. For that, you can quickly search your Bash history by typing <kbd>Ctrl+R</kbd> -> `setup.sh`, and this command will pop-up.

## Supports

<table>
<th>Windows</th>
<th>Macos</th>
<th>Linux</th>
<tr align="center">
<td colspan=1>✅ Yes</td>
<td colspan=1>✅ Yes</td>
<td colspan=1>❔</td>
</tr>
<tr align="center">
<td><sup>*requires <a href="https://git-scm.com/downloads">Git / Git Bash</a></sup></td>
<td></td>
<td><sup>*should work, but not tested</sup></td>
</tr>
</table>
