# Disable save-prefix in order to set strict versions for higher reliability from errors through years
npm config set save-exact=true -g
yarn config set save-prefix ""
