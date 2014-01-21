

## @herebox .zshrc
# 
# init 2012

### begin oh-my-zsh/templates/zshrc.zsh-template

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

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# turn off autocorrect
unsetopt correct_all

### end oh-my-zsh

# load aliases
source $HOME/.aliases

# do not record to history commands starting with space
export HISTCONTROL=ignorespace

# awscli config
export AWS_CONFIG_FILE=$HOME/.aws-config

# set screen to 256 colors for solarized
# Older systems do not have screen-256color definied so this avoids an error
# how to install this terminfo tbd...
# helpful link: http://blog.sanctum.geek.nz/tag/screen-256color/
#if [ -e /usr/share/terminfo/s/screen-256color ]; then
#    export TERM='screen-256color'       # for a tmux -2 session (also for screen)
#else
#    export TERM='screen'
#fi

# cd to ~
cd ~

### Unset gnome-keyring to avoid ssh warning in terminals on LXDE
unset GNOME_KEYRING_CONTROL

# use solarized dircolor
eval `dircolors $HOME/.dotfiles/solarized/dircolors/dircolors.256dark`
# 
# may require updated coreutils
# I had coreutils 5.97 from 2006
# dircolors --version 
# dircolors 5.97
#
# error looks like this:
# dircolors: `/home/weburban/.dotfiles/solarized/dircolors/dircolors.256dark':87: unrecognized keyword RESET
# dircolors: `/home/weburban/.dotfiles/solarized/dircolors/dircolors.256dark':91: unrecognized keyword MULTIHARDLINK
# dircolors: `/home/weburban/.dotfiles/solarized/dircolors/dircolors.256dark':100: unrecognized keyword CAPABILITY
# 
# after pulling the latest stable from GNU , which installed the binaries in /usr/local/bin/
# adding /usr/local/bin/ to the path was enough to get the newer binaries
#

# vi related

# set default editor
export EDITOR='vim'

# set shell editing mode to vi
# bash see also `info readline` 
# set -o vi
# zsh see also `info zshzle`
bindkey -v

# Setup keybindings since zsh doesn't use readline or inputrc
# https://wiki.archlinux.org/index.php/zsh
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
