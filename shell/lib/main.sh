#!/bin/bash

cd "$(dirname "$BASH_SOURCE")"

declare -a MODULES="$(find . -type f -iname '*.sh' ! -iname "`basename "$BASH_SOURCE"`")"

main() {
  for i in ${!MODULES[*]}; do
    [ -r "${MODULES[$i]}" ] && source "${MODULES[$i]}"
  done
}

main
