ZSH=${HOME}/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"

plugins=(
    brew
    bundler
    capistrano
    color-ssh
    cpanm
    docker
    emacs
    gem
    git
    github
    heroku
    osx
    pyenv
    rails
    rake
    redis-cli
    safe-paste
    ssh-agent
    vagrant
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
source ${ZSH}/oh-my-zsh.sh
source ${HOME}/.aliases

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi


if [[ -d ${HOME}/src/identity-dev-bootstrap/files ]]; then
    for s in ${HOME}/src/identity-dev-bootstrap/files/*.sh; do
        source ${s}
    done
fi

# export EMACSCLIENT='/usr/local/bin/emacsclient'
# if [[ -x ${EMACSCLIENT} ]]; then
#     alias e='emacs'
#     alias emacs='${EMACSCLIENT} --no-wait'
#     export EDITOR=${EMACSCLIENT}
# else
#     export EDITOR="vim"
# fi


mcd() {
    mkdir $1
    cd $1
}

setopt nobeep
setopt braceccl
setopt noclobber
setopt completealiases
setopt cshjunkiehistory
setopt extendedglob
setopt globcomplete
setopt globsubst
setopt histallowclobber
setopt nohup
setopt nolistambiguous
setopt nolistbeep
setopt magicequalsubst
setopt monitor
setopt numericglobsort
setopt pathdirs
setopt posixbuiltins
setopt nopromptcr
setopt pushdsilent
setopt pushdtohome
setopt rcexpandparam
setopt shoptionletters
setopt zle

autoload -U promptinit
promptinit
prompt clint
