# If you come from bash you might have to change your $PATH.
# Install Ruby Gems to ~/gems
#export GEM_HOME="$HOME/gems"
#export PATH="$HOME/gems/bin:$PATH"
#export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:$PATH
export MANPATH=$HOME/local/usr/man:$MANPATH
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if [ -f ~/.zshlocal ]; then
    source ~/.zshlocal
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.

DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/configs/custom-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  gpg-agent
  git
  git-extras
  command-not-found
  zsh-syntax-highlighting
  colored-man-pages
  common-aliases
  cp
  systemd
  docker 
  pyenv
  python
  systemd
)

#if  ! [ -z $SSH_AUTH ]  && [ $SSH_AUTH = "gpg" ]; then
#    plugins+=(gpg-agent)
#else
#    plugins+=(ssh-agent)
#fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='vim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
#export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias jump="ssh -t trampoline.net.isc.upenn.edu tmux attach -d"
alias tw-proxy="ssh -J spring.tallwireless.com"
alias penn-proxy="ssh -J hussle.net.isc.upenn.edu."
alias ki="kinit charlesr@UPENN.EDU"
alias kd="kdestroy"
alias kl="klist"
alias vi="vim"
alias ip="ip -c"
alias ip6="ip -6 -c"
alias flush-dns="sudo systemd-resolve --flush-caches"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#


# ssh-agent customizations
#zstyle :omz:plugins:ssh-agent agent-forwarding on

setopt AutoList            2>/dev/null
setopt NoBashAutoList      2>/dev/null
setopt NoBeep              2>/dev/null
setopt HistIgnoreAllDups   2>/dev/null
setopt CompleteInWord      2>/dev/null
setopt CompleteAliases     2>/dev/null
setopt Correct             2>/dev/null

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

    zstyle ':completion:*' completer _oldlist _complete _match \
    _expand _prefix _approximate

    # Don't complete backup files as executables
    zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

    # If I don't have ``executable'', don't complete to the _executable completer
    zstyle ':completion:*:functions' ignored-patterns '_*'

    # Match lowercase letters to uppercase letters and dashes to underscores (not
    # vice-versa), and allow ".t<TAB>" to list all files containing the text ".t"
    zstyle ':completion:*' matcher-list 'm:{a-z-}={A-Z_}' 'r:|.=** r:|=*'

    # Try to use verbose listings when we have more information
    zstyle ':completion:*' verbose true

    # Allows /u/l/b<TAB> to menu complete as though you typed /u*/l*/b*<TAB>
    zstyle ':completion:*:paths' expand suffix

    # Menu complete on ambiguous paths
    zstyle ':completion:*:paths' list-suffixes true

    # Have '/home//<TAB>' list '/home/*', rather than '/home/*/*'
    zstyle ':completion:*:paths' squeeze-slashes false

    # Enter "menu selection" if there are at least 2 choices while completing
    zstyle ':completion:*' menu select=2

    # vi or vim will match first files that don't end in a backup extension,
    # followed by files that do, followed last by files that are known to be binary
    # types that should probably not be edited.
    zstyle ':completion:*:*:(vi|vim):*:*' \
    file-patterns '*~(*.o|*~|*.old|*.bak|*.pro|*.zwc|*.swp):regular-files' \
    '(*~|*.bak|*.old):backup-files' \
    '(*.o|*.pro|*.zwc|*.swp):hidden-files'

    # Use colors in tab completion listings
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

    # Add a space after an expansion, so that 'ls $TERM' expands to 'ls xterm '
    zstyle ':completion:*:expand:*' add-space true

    # Tweaks to kill: list processes using the given command and show them in a menu
    zstyle ':completion:*:*:kill:*' command 'ps -u$USER -o pid,%cpu,tty,cputime,cmd'
    zstyle ':completion:*:*:kill:*' menu yes select
    zstyle ':completion:*:*:kill:*' force-list always

    # Use caching for commands that would like a cache.
    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path ${ZDOTDIR}/.zcache

    # Page long completion lists, using this prompt.
    zstyle ':completion:*' list-prompt %S%L -- More --%s

    # Show a warning when no completions were found
    zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'

    if ! (( ${+TMUX_PANE} ))  && (( ${+ZSH_TMUX_TERM} )); then                                             
        DISABLE_AUTO_TITLE="true"                                                            
fi  


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
