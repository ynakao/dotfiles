# default prompt PS1="\h:\W \u\\$ "
# \h hostname, \w abs pwd from home dir, \W only pwd, \u username
# "\" required before "\$" to escape
PS1="\W \\$ "

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
# export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# To fix pelican-quickstart error
# http://stackoverflow.com/questions/19961239/pelican-3-3-pelican-quickstart-error-valueerror-unknown-locale-utf-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# macvim settings
# alias vim='mvim --remote-tab-silent'

# cache pip-installed packages to avoid re-downloading
# from pip v6.0 no need to config cache settings?
# https://pip.pypa.io/en/latest/reference/pip_install.html#caching
# export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# golang settings
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# this line required if you install go from homebrew?
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# aws-cli command completion
complete -C aws_completer aws

# Homebrew Cask installation directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# cargo settings
export PATH=$PATH:~/.cargo/bin

# added by Anaconda3 4.1.1 installer
# export PATH="/Users/nakaoyuji/anaconda/bin:$PATH"

export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
