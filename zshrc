# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set keyboard layouts
setxkbmap us,de -option "grp:caps_toggle"

export EDITOR=vim
export COLORTERM=rxvt-unicode-256color

# Set path variables for individually compiled software
#
# Rust
export PATH=/home/rootnode/programs/installed/rust/bin:$PATH
export LD_LIBRARY_PATH=/home/rootnode/programs/installed/rust/lib:$LD_LIBRARY_PATH

#export PATH=/home/rootnode/programs/installed/rust-nightly/bin:$PATH
#export LD_LIBRARY_PATH=/home/rootnode/programs/installed/rust-nightly/lib:$LD_LIBRARY_PATH

# Cargo
export PATH=/home/rootnode/programs/installed/cargo/bin:$PATH
#

export PATH=/home/rootnode/.cabal/bin:$PATH

# Darktable
export PATH=/home/rootnode/programs/installed/darktable/bin:$PATH

# TIM
export PATH=/home/rootnode/programs/src/Tim:$PATH

# WTFTW
export PATH=/home/rootnode/code/rust/wtftw/target/release:$PATH

# Gems
export PATH=/home/rootnode/.gem/ruby/2.1.0/bin:$PATH

echo -e -n "\x1b[\x35 q" # changes to blinking bar
