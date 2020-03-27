# Folders
export XDG_CONFIG_HOME="$HOME/.config"
export DEVEL_HOME="$HOME/Dokumente/dev"

# Jupyter / IPython
export IPYTHONDIR="$HOME/.config/ipython"
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab

# GO
export GOPATH="$HOME/.go"
export PATH=$PATH:$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin:$PATH

# ZSH Settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export DISPLAY=:0

# Programs
export SHELL='/bin/zsh'
export EDITOR='vim'
export PAGER=nvimpager

# My own paths
export PATH=$PATH:$DEVEL_HOME/c/st-0.8.2/
