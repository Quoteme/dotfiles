# colors for normal ls (not needed because of exo
eval $( dircolors -b $XDG_CONFIG_HOME/zsh/LS_COLORS/LS_COLORS )
export LS_COLORS

# highlighting
source $XDG_CONFIG_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
