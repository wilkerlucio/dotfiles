# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wilker"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git rvm osx pow brew gem github devdir bundler)

source $ZSH/oh-my-zsh.sh
# Customize to your needs...

alias g="git status"
alias gl="git pull --rebase"
alias r="rails"
alias rp="touch tmp/restart.txt"

export EDITOR="mvim -f"
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/Users/wilkerlucio/Development/clojure-experiments/clojurescript/bin:$PATH
export RAILS_ENV=development
export NODE_SERVER=localhost:8080
export NODE_PATH="/usr/local/lib/node"
export LANG=pt_BR
export CLASSPATH=.:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar

if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi
