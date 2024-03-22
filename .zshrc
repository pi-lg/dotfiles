# load zgen
source "${HOME}/.zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # completions
  zgen load zsh-users/zsh-completions src

  # plugins
  zgen load djui/alias-tips
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions

  # theme
	#zgen load agnoster/agnoster-zsh-theme agnoster.zsh-theme
	#zgen oh-my-zsh themes/agnoster

	# install ttf-ancient-fonts to use bullet-train
	zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
#  zgen load joel-porquet/zsh-dircolors-solarized

  # save all to init script
  zgen save
fi

source ~/.fzf-functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='
  --extended
  --color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
  --color info:144,prompt:161,spinner:135,pointer:135,marker:118
'

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export HISTSIZE=100000000
export SAVEHIST=100000000
#eval `dircolors ${HOME}/.zgen/joel-porquet/zsh-dircolors-solarized-master/dircolors-solarized/dircolors.256dark`

KUBECONFIG="/home/paul/Dropbox/Arbeit/mbr-targeting/kubernetes-config"
export KUBECONFIG

bindkey -v

DEFAULT_USER="paul"
prompt_context(){}

# print_hostname() {
#   host_name=$(hostname -s)
#   if [[ "${host_name}" == 'mbr-ThinkPad-T430s' ]] || [[ "${host_name}" == 'oskar-mbp' ]]; then
#     echo ''
#   else
#     echo " ${host_name} "
#   fi
# }
#
# print_rprompt() {
#   host_name=$(hostname -s)
#   if [[ "${host_name}" == 'mbr-ThinkPad-T430s' ]]; then
#     echo ''
#   else
#     export ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+%{$reset_color%}"
#     export ZSH_THEME_GIT_PROMPT_PREFIX=""
#     export ZSH_THEME_GIT_PROMPT_SUFFIX=""
#     echo "%B$(git_prompt_info)%b %~"
#   fi
# }
# 
# export PROMPT='$(print_hostname) %(?.> .%F{red}> %f)'
# export RPROMPT='$(print_rprompt)'

setopt hist_ignorealldups

# switch to vim cmd mode like in .vimrc
# bindkey -M viins 'jk' vi-cmd-mode

export EDITOR=vim
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/paul/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)


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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi


# . ~/git/toolbox/etc/git-shortcuts

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# options for bullet-train theme
BULLETTRAIN_PROMPT_ORDER=(
  time
  context
  virtualenv
  dir
  git
)

# powerline-daemon
# powerline-config tmux setup

# if [[ -r ~/.local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#     source ~/.local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
# fi


mkcdir ()
{
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/paul/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/paul/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/paul/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/paul/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# autojump - see: https://github.com/wting/autojump
[[ -s /home/paul/.autojump/etc/profile.d/autojump.sh ]] && source /home/paul/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

