# Load brew
eval $(/opt/homebrew/bin/brew shellenv)

# Init non-path vars
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export EDITOR=kak
export BUNDLER_EDITOR="kak -e filetree"
export GPG_TTY=`tty`

# Actually start oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME='minimal'
plugins=(git gitfast common-aliases tmux zsh-syntax-highlighting)
source "${ZSH}/oh-my-zsh.sh"

unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Init miscellaneous executables
export PATH="/opt/homebrew/opt/libressl/bin:${PATH}"

# Init rbenv _after_ path-altering ohmyzsh
export PATH="${HOME}/.rbenv/bin:${HOME}/.pyenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"
type -a pyenv > /dev/null && eval "$(pyenv init -)"

# Lastly, add current dir to PATH (after ohmyzsh)
export PATH=./node_modules/.bin:$PATH
export PATH=./bin:$PATH

