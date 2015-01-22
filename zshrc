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

raw-name() {
    echo "$*" | cut -d '.' --complement -f2-
}

# Convert a markdown file to manpage format and pipe it to stdout
mdcat() {
    grep -v "\-\-\-\-\-" "$*" | pandoc -s -f markdown -t man | groff -T utf8 -man
}

# Convert a markdown file to manpage and read it with less
mdless() {
    mdcat "$*" | less
}

# Convert a markdown file to html and view it inside the terminal with w3m
mdweb() {
    grep -v "\-\-\-\-\-" "$*" | pandoc -s -f markdown -t html --webtex=http://chart.apis.google.com/chart\?cht\=tx\&chf\=bg,s,161616FF\&chco=FFFFFF\&chl\= --toc | w3m -T text/html
}

md-create-pdf() {
    grep -v "\-\-\-\-\-" "$*" | pandoc --toc -o `(raw-name "$*")`.pdf
}

md-create-html-slides() {
    pandoc --self-contained --webtex -t dzslides "$*" -o `(raw-name "$*")`.html
}

md-create-pdf-slides() {
    pandoc -t beamer -V theme:Rochester "$*" -o `(raw-name "$*")`_slides.pdf
}
