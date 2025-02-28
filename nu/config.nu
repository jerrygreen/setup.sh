# My typical Zoxide configuration: use "cd" without arguments for interactive change directory
source ($nu.default-config-dir | path join 'zoxide.nu')
def --env __zoxide_z2 [...rest:string] {
  if (($rest | length) == 0) {
    __zoxide_zi
  } else {
    let arg0 = ($rest | append '~').0
    let path = if (($rest | length) <= 1) and ($arg0 == '-' or ($arg0 | path expand | path type) == dir) {
      $arg0
      } else {
      (zoxide query --exclude $env.PWD -- ...$rest | str trim -r -c "\n")
    }
    cd $path
  }
}
alias cd = __zoxide_z2
alias cdi = __zoxide_zi
alias x = npx
alias re = nixos-rebuild switch
alias gt = git

def killport [port: int] {
    let command = $"lsof -i :($port)"
    let process_info = (^sh -c $command | grep LISTEN | awk '{print $2}')

    if ($process_info | is-empty) {
        echo $"No process found running on port ($port)"
    } else {
        let pid = ($process_info | into int)
        echo $"Killing process running on port ($port): ($pid)"
        kill -9 $pid
    }
}
