# Variables
if [ -f ~/.bash_variables ]
then
  . ~/.bash_variables
fi

# Environment
if [ -f ~/.bash_environment ]
then
  . ~/.bash_environment
fi

# Functions
if [ -f ~/.bash_functions ]
then
  . ~/.bash_functions
fi

# Aliases
if [ -f ~/.bash_aliases ]
then
  . ~/.bash_aliases
fi