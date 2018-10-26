# zsh version: 5.1.1
# antigen version: 2.2.2

export TERM="xterm-256color"
export EDITOR="vim"
export PATH="/home/nathanlim/.linuxbrew/sbin:/home/nathanlim/.linuxbrew/bin:/home/nathanlim/anaconda3/bin:/home/nathanlim/local/sbin:/home/nathanlim/local/bin:/home/nathanlim/sbin:/home/nathanlim/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

#fpath=("$HOME/.linuxbrew/share/zsh/functions" $fpath)
#export FPATH="$FPATH"

autoload -Uz compinit && compinit
autoload -Uz copy-earlier-word
zle -N copy-earlier-word

# Save history so we get auto suggestions
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
HIST_STAMPS="yyyy-mm-dd"
UPDATE_ZSH_DAYS="30"
COMPLETION_WAITING_DOTS="true"

# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances

#setopt correct_all # autocorrect commands
setopt interactive_comments # allow comments in interactive shells

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Verbose completion results
zstyle ':completion:*' verbose true

# Keep directories and files seperated
zstyle ':completion:*' list-dirs-first true

# Source ZSH Plugins
ADOTDIR="$HOME/.antigen"
ANTIGEN_BUNDLES="$ADOTDIR/bundles"
ANTIGEN_PLUGIN_UPDATE_DAYS=30
ANTIGEN_SYSTEM_UPDATE_DAYS=30
ANTIGEN_CAHCE="$ADOTDIR/init.zsh"
ANTIGEN_COMPDUMP="$ADOTDIR/.zcompdump"

source /home/nathanlim/.antigen/antigen.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle robbyrussell/oh-my-zsh plugins/gitfast
antigen bundle robbyrussell/oh-my-zsh plugins/git-extras
antigen bundle robbyrussell/oh-my-zsh plugins/pip
antigen bundle robbyrussell/oh-my-zsh plugins/python
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle denolfe/zsh-travis
antigen bundle rutchkiwi/copyzshell
antigen bundle gretzky/auto-color-ls
#antigen bundle chrissicool/zsh-bash
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle popstas/zsh-command-time
antigen bundle paulmelnikow/zsh-startup-timer
antigen bundle trapd00r/zsh-syntax-highlighting-filetypes
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle urbainvaes/fzf-marks
antigen bundle ytet5uy4/fzf-widgets
antigen bundle zdharma/fast-syntax-highlighting



# hotkeys
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^@' fzf-select-widget
bindkey '^@.' fzf-edit-dotfiles
bindkey '^@c' fzf-change-directory
bindkey '^@f' fzf-edit-files
bindkey '^@k' fzf-kill-processes
bindkey '^@s' fzf-exec-ssh
bindkey '^\' fzf-change-recent-directory
bindkey '^r' fzf-insert-history
bindkey '^xf' fzf-insert-files
bindkey '^xd' fzf-insert-directory
bindkey '^@g' fzf-select-git-widget
bindkey '^@ga' fzf-git-add-files
bindkey '^@gc' fzf-git-change-repository
bindkey '^@gco' fzf-git-checkout-branch
bindkey '^@gd' fzf-git-delete-branches
bindkey '^@gh' fzf-select-github-widget
bindkey '^@ghi' fzf-github-show-issue
bindkey '^@ghe' fzf-github-edit-issue
bindkey '^@gho' fzf-github-open-issue

# fzf
export FZF_TMUX=0
export FZF_DEFAULT_OPTS="--height 100% --reverse"

# fzf-widgets: fzf-change-reset-dir
declare -p FZF_WIDGETS_OPTS > /dev/null 2>&1 && FZF_WIDGETS_OPTS[insert-history]="--exact"
declare -p FZF_WIDGET_OPTS > /dev/null 2>&1 && FZF_WIDGET_OPTS[insert-history]="--exact"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240" # gray highlight

# # powerlevel9k
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k/powerlevel9k.zsh-theme

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

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B0"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon anaconda context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time time load)


antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply


. $HOME/anaconda3/etc/profile.d/conda.sh
conda activate
source ~/.bash_aliases
alias git='g'
alias lc='colorls -lA --sd'
alias cls='colorls'


# user configs
[[ -r /etc/zsh/zshrc.local ]] && source /etc/zsh/zshrc.local
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
