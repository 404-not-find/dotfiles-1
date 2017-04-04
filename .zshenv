unsetopt GLOBAL_RCS

if [[ -x '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient' ]]; then
    export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
else
    export EDITOR="vim"
fi
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export PATH="${HOME}/bin:.git/safe/../../bin:/usr/sbin:${PATH}"
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
  . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
  . ${HOME}/.zshenv.${OSTYPE%%.*}
fi

