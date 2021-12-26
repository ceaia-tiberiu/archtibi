# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tiberiu/.oh-my-zsh"
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="avit"
# Bat Theme
export BAT_THEME="GitHub"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm zsh-autosuggestions zsh-syntax-highlighting docker cargo)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

ZSH_DISABLE_COMPFIX="true"
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi


#add work folder
if [ -d "$HOME/.bin/giffgaff" ] ;
  then PATH="$HOME/.bin/giffgaff:$PATH"
fi



export EDITOR='code -w'

# FileSearch
function f() { find . -iname "*$1*" ${@:2}; }
function r() { grep "$1" ${@:2} -R .; }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

function dlog() { docker logs -f "$@"; }

# removes node modules
function rmnm(){
  find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
}


alias envconfig="code ~/.zshrc";
alias sites="cd ~/sites";
alias n10="nvm use 10";
alias n12="nvm use 12";
alias n16="nvm use 16";
alias work="cd ~/work/gg-docker/;";
alias gg="cd ~/work/gg;";
alias gapp="cd ~/dev/giffgaff/giffgaff-re-app;"

alias cask="brew install --cask"
alias dcu="docker compose up --remove-orphans -d --build;";
alias dcd="docker compose down --remove-orphans -v";
alias stubrefresh="mvn -DtestEnvironment=local initialize -Dstub.url=http://stub.local.giffgaff.com:9080/smart-stub-server"
alias c='clear';
alias cnm='find . -name "node_modules" -type d -prune -exec rm -rf '{}' +'
alias refresh='source ~/.zshrc; clear;'
alias p='lpass show -c -q --password -G';
alias cat='bat --paging=never'
alias temp='cd ~/Temp'
#Tmux Aliases
#Attatch to sessions
alias tas='tmux attach-session -t'
#new session
alias ts='tmux new -s'
alias tl='tmux ls'
alias tr='tmux source-file ~/.tmux.conf' #refresh config inside tmux
alias tconf="code ~/.tmux.conf"
alias myip='ifconfig | grep 0xffffff00'
alias felog='dlog gg-fe'
alias startssr='npm run server-watch'
alias gssr="cd ~/gg/goodybag_ssr;"
alias fport='lsof -i :8081'
alias kill='kill -9'
alias testit='mvn -B clean install -DtestEnv=it -DenableStubMode=true'
alias mvnit='mvn clean install -DskipTests'
alias mvni='mvn clean install'

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH="~/.gem/ruby/3.0.0/bin:$PATH"
export GPG_TTY=$(tty)
export PATH="/usr/local/bin:$PATH"
export PATH="~/sites/giffgaff-utils/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=$PATH:/Users/tiberiu/Library/Python/3.9/bin/
export AWS_DEFAULT_REGION=eu-west-1
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH=~/.local/bin:$PATH
export NODE_OPTIONS="--max-old-space-size=8192" #increase to 8gb
export HOME="/Users/tiberiu"
export ANDROID_HOME="/Users/tiberiu/Library/Android/sdk"
export ANDROID_SDK="$ANDROID_HOME"
export PATH="$ANDROID_HOME/build-tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH=~/instantclient_19_8:$PATH

eval export PATH="/Users/tiberiu/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

gimmesnd() {

gimme-aws-creds --profile snd
export AWS_DEFAULT_PROFILE=snd

}
gimmetst() {

gimme-aws-creds --profile tst
export AWS_DEFAULT_PROFILE=tst

}
gimmestg() {

gimme-aws-creds --profile stg
export AWS_DEFAULT_PROFILE=stg

}
gimmeprd() {

gimme-aws-creds --profile prd
export AWS_DEFAULT_PROFILE=prd
aws ecr get-login-password | docker login --username AWS --password-stdin https://604083106117.dkr.ecr.eu-west-1.amazonaws.com
}

bindkey "^F" fzf-cd-widget
# use fd instead of rg for file search, rg author says so!
export FZF_DEFAULT_COMMAND='fd --type f'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 64% --layout=reverse --border'
bindkey '^P' fzf-file-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"


# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

portalStart() {
  cd ~/work/gg/portal-system-tests; n10;
  git pull; npm run build;
}

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

autoload -U add-zsh-hook
# load-nvmrc() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     nvm use
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
