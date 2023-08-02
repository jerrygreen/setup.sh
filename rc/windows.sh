# Fix symlinks: `ln -s` bash command to actually create symbolic links, rather than making a copy (Cygwin, why this isn't default?):
export MSYS=winsymlinks:nativestrict
