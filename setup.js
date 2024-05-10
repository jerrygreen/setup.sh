const { execSync } = require('node:child_process')
const fs = require('node:fs')
const os = require('node:os')
const path = require('node:path')

const F_URL = 'https://raw.githubusercontent.com/JerryGreen/setup.sh/master/'
const envCmd = 'source ~/.rc/env.nu'
const configCmd = 'source ~/.rc/config.nu'
const RC_FILES = ['rc/config.nu', 'rc/env.nu']
const RCO_FILES = ['rc-once/git.sh', 'rc-once/npm&yarn.sh']
const HOME = os.homedir()
const envPath = execSync('/usr/local/bin/nu -c "echo \\$nu.env-path"').toString().trim()
const configPath = execSync('/usr/local/bin/nu -c "echo \\$nu.config-path"').toString().trim()
const env = fs.readFileSync(envPath).toString()
const config = fs.readFileSync(configPath).toString()

for (let f of fs.readdirSync(path.join(HOME, '.rc'))) {
	fs.rmSync(path.join(HOME, '.rc', f))
}

let promises = []
for (let f of RC_FILES) {
	const file = path.join(HOME, '.' + f)
	const url = new URL(f, F_URL).href
	promises.push(
		fetch(url)
			.then((r) => r.text())
			.then((content) =>
				fs.writeFileSync(file, content, { encoding: 'utf-8', flag: 'w' })
			)
	)
}

if (!env.includes(envCmd)) fs.appendFileSync(envPath, '\n' + envCmd + '\n')
if (!config.includes(configCmd))
	fs.appendFileSync(configPath, '\n' + configCmd + '\n')

Promise.all(promises)
