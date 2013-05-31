export EC2_HOME=${HOME}/.ec2
export EDITOR="vim"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export PATH=${PATH}:${EC2_HOME}/bin
export PATH=/usr/local/bin:${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"
preferred_locale='en_AU.UTF-8'
unset LANG
if [[ -d "/usr/share/locale/${preferred_locale}" || -d "/usr/lib/locale/${preferred_locale}" ]]; then
    export LC_ALL=${preferred_locale}
fi
