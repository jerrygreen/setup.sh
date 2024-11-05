const { execSync } = require('node:child_process')

execSync('npm config set save-exact=true; git config --global push.followTags true', {
	stdio: 'inherit',
})
