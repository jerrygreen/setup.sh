# Push git tags automatically: no more `git push --tags`!
git config --global push.followTags true

# Forever solve the warning "LF will be replaced by CRLF": https://stackoverflow.com/a/5834094/3720305
git config --global core.autocrlf true

# Automatically scroll status if needed (like git log) & shortify its output
git config --global pager.status true
git config --global status.short true
