#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/nathanlim/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# Add commonly used folders to $PATH
export MANPATH="/usr/local/man:$MANPATH"
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export OE_LICENSE="/Users/nathanlim/licenses/oe_license.txt"

# Open new tabs in same directory
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  function chpwd {
    printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
  }
  chpwd
fi

if [[ "$TERM_PROGRAM" == "nuclide" ]]; then
  export EDITOR='atom --wait'
else
  export EDITOR=vim # your favorite editor here
fi


#export DEFAULT_USER="$USER"
#prompt_context(){}

# Homebrew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Enable autocompletions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
zmodload -i zsh/complist

autoload -U compinit && compinit
# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
setopt interactive_comments # allow comments in interactive shells

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Custom Options
# # Verbose completion results
zstyle ':completion:*' verbose true
# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# Source ZSH Plugins
source $(dirname $(gem which colorls))/tab_complete.sh
source "${HOME}/.iterm2_shell_integration.zsh"

# Load antibody plugin manager
source <(antibody init)

antibody bundle < ~/.zsh_plugins.txt

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Powerlevel9K prompt config
DEFAULT_USER="$USER"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B0"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="white"
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %m.%d}"

POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B0"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh root_indicator context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time anaconda)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon battery context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time time load)

antibody bundle bhilburn/powerlevel9k

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }


bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
. //anaconda/etc/profile.d/conda.sh
conda activate
source ~/.bash_aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias lc='colorls -lA --sd'
alias cls='colorls'
export GITHUB_API_TOKEN="784f37e7806ac4b84a148d62b1a4348683f7234d"
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export PATH="/usr/local/opt/ncurses/bin:$PATH"
