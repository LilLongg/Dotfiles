#!/usr/bin/nu

let venvs = ls ~/.venv --short-names | select name
let ver = $venvs | each {|venv| ls ([$env.HOME, '.venv', $venv.name, 'bin'] | path join) --short-names | where name =~ "python" | select name | last | rename ver}
$venvs | merge $ver
