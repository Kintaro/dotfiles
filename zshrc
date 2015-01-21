# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set keyboard layouts
# setxkbmap us,de -option "grp:caps_toggle"
# ibus-daemon -rdx
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Set editor and terminal
export EDITOR=vim
export COLORTERM=rxvt-unicode-256color

# Set path variables for individually compiled software
#
# Rust
export PATH=/home/rootnode/programs/installed/rust/bin:$PATH
export LD_LIBRARY_PATH=/home/rootnode/programs/installed/rust/lib:$LD_LIBRARY_PATH

# Cargo
export PATH=/home/rootnode/programs/installed/cargo/bin:$PATH

# Cabal
export PATH=/home/rootnode/.cabal/bin:$PATH

mdless() {
    pandoc -s -f markdown -t man "$*" | groff -T utf8 -man | less
}
