const { execSync } = require('node:child_process')
const fs = require('node:fs')
const os = require('node:os')
const path = require('node:path')

const F_URL = 'https://raw.githubusercontent.com/jerrygreen/setup.sh/master/'
const envRc = '~/.rc/env.nu'
const configRc = '~/.rc/config.nu'
const NU_PATH = execSync('which nu').toString().trim()
const RC_FILES = ['nu/env.nu', 'nu/config.nu']
const RCO_FILES = ['rc/git.sh', 'rc/npm&yarn.sh']
const HOME = os.homedir()

const CMD = "$nu.default-config-dir | path join 'rc.nu'"
const RC_FILE = execSync(`${NU_PATH} -c "echo \\${CMD}"`).toString().trim()
const ENV_PATH = execSync(`${NU_PATH} -c "echo \\$nu.env-path"`).toString().trim()
const CONF_PATH = execSync(`${NU_PATH} -c "echo \\$nu.config-path"`).toString().trim()

const env = fs.readFileSync(ENV_PATH).toString()
const config = fs.readFileSync(CONF_PATH).toString()

const nuPath = execSync('which nu || echo').toString().trim()
if (!nuPath) {
	console.error("Nushell not found! Please install nushell:")
	console.error("https://www.nushell.sh")
	process.exit(1);
}
const zoxidePath = execSync('which zoxide || echo').toString().trim()
if (zoxidePath) {
	// execSync(`${NU_PATH} -c "zoxide init nushell | save -f ~/.zoxide.nu | echo"`)
	execSync(`${NU_PATH} -c "zoxide init nushell | save -f (\\$nu.default-config-dir | path join 'zoxide.nu') | echo"`)
} else {
	console.error("Zoxide not found! Please install zoxide:")
	console.error("https://github.com/ajeetdsouza/zoxide")
	process.exit(1);
}
const fzfPath = execSync('which fzf || echo').toString().trim()
if (!fzfPath) {
	console.error("fzf not found! Please install fzf:")
	console.error("https://github.com/junegunn/fzf")
	process.exit(1);
}

let promises = []
for (let f of RCO_FILES) {
	const url = new URL(f, F_URL).href
	promises.push(
		fetch(url)
			.then((r) => r.text())
	)
}

for (let f of RC_FILES) {
	const url = new URL(f, F_URL).href
	promises.push(
		fetch(url)
			.then((r) => r.text())
	)
}

if (!config.includes(`source (${CMD})`)) fs.appendFileSync(CONF_PATH, '\n' + 'source (' + CMD + ')\n')

Promise.all(promises).then(data => {
	fs.writeFileSync(RC_FILE, data.join('\n'), {encoding: 'utf-8', flag: 'w'})
	process.exit();
});
