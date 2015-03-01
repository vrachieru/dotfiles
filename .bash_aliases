#-#
#-# File listing
#-#

alias ls='ls -lah'
alias lx='ls -lahX'
alias lz='ls -lahS'
alias ld='ls -laht'
alias lp='ls -d $PWD/{*,.*}'


#-#
#-# Editors
#-#

alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='sublime'

#-#
#-# Grep
#-#

alias grep='grep -n --color'
alias egrep='egrep -n --color=auto'
alias fgrep='fgrep -n --color=auto'


#-#
#-# Directories
#-#

alias mkdir='mkdir -pv'
alias clrdir='find . -type d -empty -delete' # recursively remove all empty directories

#-#
#-# File actions
#-#

alias cp='cp -v'
alias cpr='cp -r'
alias mv='mv -v'


#-#
#-# Maven
#-#

alias mvn:clean='mvn clean'
alias mvn:install='mvn clean install'
alias mvn:prepare='mvn org.apache.maven.plugins:maven-release-plugin:2.5:prepare'
alias mvn:perform='mvn org.apache.maven.plugins:maven-release-plugin:2.5:perform'


#-#
#-# Easier navigation
#-#

alias ..='cd ../..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../..'
alias ......='cd ../../../../../../'
alias .......='cd ../../../../../../../'
alias ........='cd ../../../../../../../../'
alias .........='cd ../../../../../../../../../'
alias ..........='cd ../../../../../../../../../../'


#-#
#-# Shortcuts
#-#

alias reload='source ~/.bash_profile'


#-#
#-# IP addresses
#-#

alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias lip="ifconfig | grep 'inet ' | grep -v '127.0.0.1' | head -n1 | awk '{print $2}'" #ipconfig getifaddr en1


#-#
#-# Misc
#-#

alias fucking=sudo
alias cls='clear'

if [[ $SYSTEM_OS -eq 'Darwin' ]]; then
  alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
  alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'
fi
