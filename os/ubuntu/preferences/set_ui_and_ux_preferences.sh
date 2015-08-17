#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
  && source '../../utils.sh'

set_ui_and_ux_preferences() {
  execute 'gsettings set com.canonical.indicator.bluetooth visible false' \
    'Hide bluetooth icon from the menu bar'

  execute 'gsettings set com.canonical.indicator.datetime custom-time-format "%l:%M %p" &&
           gsettings set com.canonical.indicator.datetime time-format "custom"' \
  'Use custom date format in the menu bar'

  execute 'gsettings set org.gnome.desktop.background picture-options "stretched"' \
    'Set desktop background image options'

# execute 'gsettings set org.gnome.desktop.background picture-uri 'file:///home/...' &> /dev/null' \
#   'Set desktop background image location'

  execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us', 'ro' ]\"" \
    'Set keyboard languages'

  execute "gsettings set com.canonical.Unity.Launcher favorites \"[
            'nautilus-home.desktop',
            'firefox.desktop',
            'skype-personal.desktop',
            'skype-work.desktop',
            'viber.desktop',
            'eclipse.desktop',
            'sublime-text.desktop',
            'gnome-terminal.desktop',
            'gnome-system-monitor.desktop'
          ]\"" \
    'Set Launcher favorites'
}

main() {
  print_in_purple '\n  UI & UX\n\n'
  set_ui_and_ux_preferences
}

main
