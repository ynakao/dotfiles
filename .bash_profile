# default prompt PS1="\h:\W \u\\$ "
# \h hostname, \w abs pwd from home dir, \W only pwd, \u username
# "\" required before "\$" to escape
PS1="\W \\$ "

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Set default editor
export EDITOR=nvim

# Set HISTSIZE
export HISTSIZE=100000

# golang settings
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# this line required if you install go from homebrew?
# export PATH=$PATH:/usr/local/opt/go/libexec/bin

# aws-cli command completion
complete -C aws_completer aws

# cargo settings
export PATH=$PATH:~/.cargo/bin

# racer settings
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

# login fish shell
# fish

# Homebrew-ed perl caveats
# https://github.com/Homebrew/homebrew-core/blob/1d1f4b48e2b1b519f48e8217ddf32d838095735e/Formula/perl.rb#L64-L69
# read also https://github.com/KDE-mac/homebrew-kde/issues/141
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# login zsh
zsh
