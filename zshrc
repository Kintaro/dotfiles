#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:/home/wollwage/.cabal/bin

# Sublime
export PATH=$PATH:/home/wollwage/programs/installed/sublime

# Go
export GOPATH=/home/wollwage/code/go/golib

# GHC
export PATH=/home/wollwage/programs/installed/ghc/bin:$PATH
