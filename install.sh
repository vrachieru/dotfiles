#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
  && source 'os/utils.sh'

main() {
  ask_for_sudo

  install_step 'Create directories' \
    'Do you want the additional directories to be created?' \
    ['create_directories']

  install_step 'Create symbolic links' \
    ['create_symbolic_links']

  install_step 'Install applications' \
    'Do you want to install the applications/command line tools?' \
    ['install_applications']

  install_step 'Set preferences' \
    'Do you want to set the custom preferences?' \
    ['set_preferences']

  install_step 'Restart' \
    'Do you want to restart?' \
    ['restart']
}

main
