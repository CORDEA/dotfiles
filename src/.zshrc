alias ls='ls -G'
alias top='top -o cpu'
alias watch='watch --color'

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000

setopt print_eight_bit

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

setopt auto_cd
setopt interactive_comments

autoload -U compinit
compinit

[ -n "$(command -v hub)" ] && function git(){hub "$@"}

function precmd_console() {
    head="(*'-') < "
    line=`git log -1 --pretty="%s - %an/%cn" 2> /dev/null`
    branch="\e[95m[`git rev-parse --abbrev-ref HEAD 2> /dev/null `]\e[0m"
    if [[ $line != "" ]]; then
        echo "$head$branch $line"
    fi
    echo "$head`pwd`"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_console

case "$TERM" in
    xterm*|kterm*|rxvt*)
    PROMPT='x> '
    ;;
    *)
    PROMPT='t> '
    ;;
esac

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
