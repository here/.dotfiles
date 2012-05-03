

## mikey .zshrc
# 
# init 2012

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="sunrise" #has exit status
#ZSH_THEME="smt" #has commit clock
#ZSH_THEME="tjkirch" #Based on dst, plus a lightning bolt and return codes.
#ZSH_THEME="wedisagree"
#ZSH_THEME="random"
#ZSH_THEME="random"
ZSH_THEME="nanotech"


# use solarized dircolor
# 
# may require updated coreutils
# error looks like this:
# I had coreutils 5.97 from 2006
# dircolors --version 
# dircolors 5.97
# dircolors: `/home/weburban/.dotfiles/solarized/dircolors/dircolors.256dark':87: unrecognized keyword RESET
# dircolors: `/home/weburban/.dotfiles/solarized/dircolors/dircolors.256dark':91: unrecognized keyword MULTIHARDLINK
# dircolors: `/home/weburban/.dotfiles/solarized/dircolors/dircolors.256dark':100: unrecognized keyword CAPABILITY
# 
# after pulling the latest stable from GNU , which installed the binaries in /usr/local/bin/
# adding /usr/local/bin/ to the path was enough to get the newer binaries
#
eval `dircolors $HOME/.dotfiles/solarized/dircolors/dircolors.256dark`

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

### end oh-my-zsh

source $HOME/.aliases

export EDITOR='vim'


# set screen to 256 colors for solarized
# Older systems do not have screen-256color definied so this avoids an error
# how to install this terminfo tbd...
# helpful link: http://blog.sanctum.geek.nz/tag/screen-256color/
if [ -e /usr/share/terminfo/s/screen-256color ]; then
    export TERM='screen-256color'       # for a tmux -2 session (also for screen)
else
    export TERM='screen'
fi


