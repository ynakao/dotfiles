# 標準のプロンプト PS1="\h:\W \u\\$ "
# \h ホスト名, \w 作業ディレクトリをホームからの絶対パスで表示, \W 作業ディレクトリのみ表示, \u ユーザー名, \$の前にはエスケープの\が必要か。
PS1="\W \\$ "

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
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
alias vim='mvim --remote-tab-silent'

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# golang settings
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# aws-cli command completion
complete -C aws_completer aws
