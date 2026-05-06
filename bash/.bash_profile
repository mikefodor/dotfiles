export EDITOR='nvim'


alias ffprobe_size="ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1"
alias ffprobe_resolution="ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0"

## Append path to $PATH but don't allow duplicates
path_add() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}

## Add mysql to $PATH
path_add "/usr/local/mysql/bin/"

## Setup GOPATH
export GOPATH=$HOME/go
path_add "$GOPATH/bin"

export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
