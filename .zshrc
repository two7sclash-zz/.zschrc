export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/Library/Python/2.7/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=/Users/jamesfishwick/.oh-my-zsh
 export EDITOR='/usr/local/bin/atom'
 export PATH="$HOME/.npm-packages/bin:$PATH"
 export NVM_DIR=~/.nvm

 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

##
# If you installed via Homebrew on OS X, you can use the following:
#source $(brew --prefix nvm)/nvm.sh
#
source ~/.nvm/nvm.sh
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PAGER=less
export MANPAGER="less -r"
alias lesr='less -r'

# npx auto fallback
source <(npx --shell-auto-fallback zsh)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Base16 Shell
BASE16_SHELL="$HOME/.config/oceanic-next-shell/oceanic-next.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# ZSH options
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt AUTO_NAME_DIRS
setopt HIST_REDUCE_BLANKS
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
bindkey '\eq' push-line-or-edit

# Some of Brendano's options
setopt autopushd pushdminus pushdtohome autocd pushdignoredups
autoload -U zmv
autoload -U compinit
compinit
setopt clobber
setopt correctall
setopt equals
setopt extendedglob
setopt interactive_comments
setopt longlistjobs
setopt nohup
setopt nonomatch  # echo not-here*  actually gets the *
#setopt nullglob  # echo not-here*  expands to no args

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#zsh-morpho
plugins=(zsh-nvm virtualenvwrapper gitfast z tumult command-time terminal-app)

source $ZSH/oh-my-zsh.sh
source /Users/jamesfishwick/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/jamesfishwick/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# User configuration
alias git=hub
alias pu=pushd
alias p=popd
alias ..="cd .."
alias d='dirs -v'
alias h=history
alias ll='ls -l'
alias la='ls -a'
# List only file beginning with "."
alias lsa='ls -ld .*'
alias grep='grep --color'
alias cgrep='grep --color=always'
alias faceoff='sudo killall VDCAssistant'
alias listen='lsof -i | grep LISTEN'
function lcgrep() {
  grep --color=always "$@" | less -r
}
function jarvis() {
    cd ~/Jarvis/
    python main.py
}

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

PATH="/Users/jamesfishwick/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jamesfishwick/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jamesfishwick/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jamesfishwick/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jamesfishwick/perl5"; export PERL_MM_OPT;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jamesfishwick/.sdkman"
[[ -s "/Users/jamesfishwick/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jamesfishwick/.sdkman/bin/sdkman-init.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jamesfishwick/.nvm/versions/node/v8.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jamesfishwick/.nvm/versions/node/v8.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jamesfishwick/.nvm/versions/node/v8.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jamesfishwick/.nvm/versions/node/v8.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
