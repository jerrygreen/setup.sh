# Push git tags automatically: no more `git push --tags`!
git config --global push.followTags true

# Forever solve the warning "LF will be replaced by CRLF": https://stackoverflow.com/a/5834094/3720305
git config --global core.autocrlf true

# Automatically scroll status if needed (like git log)
git config --global pager.status true

# `git lg` - alternative git log for short: https://stackoverflow.com/a/36731148/3720305
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit"
