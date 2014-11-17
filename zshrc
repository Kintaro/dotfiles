# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set keyboard layouts
setxkbmap us,de -option "grp:alt_shift_toggle"

# Set path variables for individually compiled software
#
# Rust
export PATH=/home/wollwage/programs/installed/rust/bin:$PATH
export LD_LIBRARY_PATH=/home/wollwage/programs/installed/rust/lib:$LD_LIBRARY_PATH

# Cargo
export PATH=/home/wollwage/programs/installed/cargo/bin:$PATH

# Darktable
export PATH=/home/wollwage/programs/installed/darktable/bin:$PATH

# TIM
export PATH=/home/wollwage/programs/src/Tim:$PATH
