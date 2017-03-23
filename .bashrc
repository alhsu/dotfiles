# Basic

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

#export LANG=C.UTF-8
#export LC_ALL=C.UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8" 

export PATH="~/bin:$PATH"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

if [[ "$platform" == 'osx' ]]; then
	alias ls="ls -G"
	alias removexattrs="chmod -RN . && xattr -c ."
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		source $(brew --prefix)/etc/bash_completion
	fi
else
	alias ls="ls --color"
	if [ -f /etc/bash_completion ]; then
    	source /etc/bash_completion
	fi
fi

# AWS
complete -C aws_completer aws

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# added by travis gem
[ -f /Users/romanvg/.travis/travis.sh ] && source /Users/romanvg/.travis/travis.sh


# linuxbrew
if [[ "$platform" == 'linux' ]]; then
	export PATH="$HOME/.linuxbrew/bin:$PATH"
	export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
	export CC=${CC:-`which gcc`} && export CXX=${CXX:-`which g++`}
	# Cannot be bothered to pass --env=inherit every time
	function brew {
		~/.linuxbrew/bin/brew "$@" --env=inherit;
	}
fi

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/lib/go-1.7/bin

# Docker
alias drma="docker ps -aq --no-trunc | xargs docker rm"
alias dkd="docker run -d -P"
alias dki="docker run -t -i -P"
alias dco="docker-compose"
alias dpa="docker ps -a"

# Espressif toolchains for esp8266 and esp32
export PATH=$PATH:$HOME/dev/espressif/crosstool-NG/builds/xtensa-esp32-elf/bin
export PATH=$HOME/dev/espressif/esp-open-sdk/xtensa-lx106-elf/bin:$PATH
export IDF_PATH=~/dev/espressif/esp-idf

# Slurm
alias slurm_template='echo "#!/bin/bash

#SBATCH -n 1
#SBATCH -J
#SBATCH -p defq
#SBATCH -o %J.err
#SBATCH -e %J.out
#SBATCH --time=240:00:00
" > slurm.sh'

# KiCad/SKidl
export KISYSMOD="/usr/share/kicad/modules"

# Android
export USE_CCACHE=1
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx2G"

# added by Miniconda3 4.2.12 installer
export PATH="/home/romanvg/.miniconda3/bin:$PATH"
