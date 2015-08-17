#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
  && source 'utils.sh'

declare -a DIRECTORIES=(
  "$HOME/backup"
  "$HOME/Downloads/browser"
  "$HOME/Downloads/torrent"
  "$HOME/vms"
  "$HOME/work"
  "$HOME/work/code"
  "$HOME/work/code/asm"
  "$HOME/work/code/bash"
  "$HOME/work/code/c"
  "$HOME/work/code/java"
  "$HOME/work/code/js"
  "$HOME/work/code/node"
  "$HOME/work/code/python"
  "$HOME/work/docs"
  "$HOME/work/docs/books"
  "$HOME/work/git/github"
  "$HOME/work/git/silver"
  "$HOME/work/projects"
  "$HOME/work/svn"
  "$HOME/work/svn/fenrir"
  "$HOME/work/svn/xwiki"
)

main() {
  for d in ${DIRECTORIES[@]}; do
    mkd "$d"
  done
}

main
