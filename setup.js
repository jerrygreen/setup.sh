const { execSync } = require('node:child_process')
const fs = require('node:fs')
const os = require('node:os')
const path = require('node:path')

const F_URL = 'https://raw.githubusercontent.com/jerrygreen/setup.sh/master/'
const S = os.version().toLowerCase().includes('windows') ? '' : '\\'
const NU_PATH = execSync('which nu')
	.toString()
	.trim()
	.replace('/cygdrive', '')
	.replace('/c/', 'C:/')
const HOME_FILES = ['.bunfig.toml']
const CONF_FILES = ['nu/env.nu', 'nu/config.nu']
// const RC_FILES = ['rc/aliases.nu']
const RCO_FILES = ['rco/git.sh', 'rco/npm.sh']
const HOME = os.homedir()

const CMD = `$nu.default-config-dir | path join 'rc.nu'`
const HOME = execSync(`${NU_PATH} -c "${S}$nu.HOME"`).toString().trim()
const RC_FILE = execSync(`${NU_PATH} -c "${S}${CMD}"`).toString().trim()
const ENV_PATH = execSync(`${NU_PATH} -c "${S}$nu.env-path"`).toString().trim()
const CONF_PATH = execSync(`${NU_PATH} -c "${S}$nu.config-path"`).toString().trim()

const env = fs.readFileSync(ENV_PATH).toString()
const config = fs.readFileSync(CONF_PATH).toString()

const nuPath = execSync('which nu || echo').toString().trim()
if (!nuPath) {
	console.error('Nushell not found! Please install nushell:')
	console.error('https://www.nushell.sh')
	process.exit(1)
}
const zoxidePath = execSync('which zoxide || echo').toString().trim()
if (zoxidePath) {
	// execSync(`${NU_PATH} -c "zoxide init nushell | save -f ~/.zoxide.nu | echo"`)
	execSync(
		`${NU_PATH} -c "zoxide init nushell | save -f (${S}$nu.default-config-dir | path join 'zoxide.nu') | echo"`
	)
} else {
	console.error('Zoxide not found! Please install zoxide:')
	console.error('https://github.com/ajeetdsouza/zoxide')
	process.exit(1)
}
const fzfPath = execSync('which fzf || echo').toString().trim()
if (!fzfPath) {
	console.error('fzf not found! Please install fzf:')
	console.error('https://github.com/junegunn/fzf')
	process.exit(1)
}

let promises0 = []
let promises1 = []
let promises2 = []
let promises3 = []
for (let f of HOME_FILES) {
	const url = new URL(f, F_URL).href
	promises0.push(fetch(url).then((r) => r.text()))
}

for (let f of CONF_FILES) {
	const url = new URL(f, F_URL).href
	promises1.push(fetch(url).then((r) => r.text()))
}

// for (let f of RC_FILES) {
// 	const url = new URL(f, F_URL).href
// 	promises2.push(fetch(url).then((r) => r.text()))
// }

for (let f of RCO_FILES) {
	const url = new URL(f, F_URL).href
	promises3.push(fetch(url).then((r) => r.text()))
}

if (!config.includes(`source (${CMD})`))
	fs.appendFileSync(CONF_PATH, '\n' + 'source (' + CMD + ')\n')

Promise.all([
	Promise.all(promises0).then((data) => {
		for (let i = 0; i < HOME_FILES.length; i++) {
			fs.writeFileSync(HOME + '/' +  HOME_FILES[i], data[i], { encoding: 'utf-8', flag: 'w' })
		}
	}),
	Promise.all(promises1).then((data) => {
		const content = data.join('\n')
		fs.writeFileSync(RC_FILE, content, { encoding: 'utf-8', flag: 'w' })
		execSync(`${NU_PATH} -c "source (${S}${CMD})"`)
	}),
	Promise.all(promises3).then((data) => {
		let cmds = data
			.join('\n')
			.replaceAll(/#+[^#]+?\n/g, '')
			.replaceAll('\n', ';')
			.replaceAll(/;+/g, '; ')
			.trim()
			.split('; ')
		for (i = 0; i < cmds.length; i++) {
			execSync(cmds[i].trim().replaceAll(';', ''), { stdio: 'inherit' })
		}
	}),
]).then(() => {
	process.exit()
})
