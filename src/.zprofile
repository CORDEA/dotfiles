case "$OSTYPE" in
darwin*)
    export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
    export PATH=$HOME/.commands:$PATH
    export PATH=/usr/local/android/android-ndk-r11c:$PATH

    for file in `find ~/Documents/git-cloning/nims/ -d 1`; do
        export PATH="$file/bin/":$PATH;
    done

    export PATH=/usr/local/bin/decor:$PATH

    export WORKON_HOME=/usr/local/bin/:$WORKON_HOME
    ;;
linux*)
    export MANPATH=/opt/local/man:$MANPATH
    export LANG=ja_JP.UTF-8

    distribution=`cat /etc/issue | cut -d ' ' -f 1 | head -n 1`;
    if [ $distribution = "Ubuntu" ] || [ $distribution = "Fedora" ]; then
        export TERM=screen-256color
    fi

    export ANDROID_HOME=$HOME/Library/Android/sdk
    ;;
esac

export EDITOR='vim'
export SHELL='zsh'
