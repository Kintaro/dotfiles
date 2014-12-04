# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set keyboard layouts
setxkbmap us,de -option "grp:caps_toggle"

export COLORTERM=rxvt-unicode-256color

# Set path variables for individually compiled software
#
# Rust
#export PATH=/home/wollwage/programs/installed/rust/bin:$PATH
#export LD_LIBRARY_PATH=/home/wollwage/programs/installed/rust/lib:$LD_LIBRARY_PATH

export PATH=/home/wollwage/programs/installed/rust-nightly/bin:$PATH
export LD_LIBRARY_PATH=/home/wollwage/programs/installed/rust-nightly/lib:$LD_LIBRARY_PATH
# Cargo
#export PATH=/home/wollwage/programs/installed/cargo/bin:$PATH
#
export LD_LIBRARY_PATH=/home/wollwage/code/rust/wtftw/target/deps:$LD_LIBRARY_PATH

# Darktable
export PATH=/home/wollwage/programs/installed/darktable/bin:$PATH

# TIM
export PATH=/home/wollwage/programs/src/Tim:$PATH

# WTFTW
export PATH=/home/wollwage/code/rust/wtftw/target:$PATH

# Gems
export PATH=/home/wollwage/.gem/ruby/2.1.0/bin:$PATH
