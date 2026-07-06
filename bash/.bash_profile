export EDITOR='nvim'


alias ffprobe_size="ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1"
alias ffprobe_resolution="ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0"

## Append path to $PATH but don't allow duplicates
path_add() {
    local IFS=':'
    for dir in $1; do
        case ":$PATH:" in
            *":$dir:"*) ;;
            *) PATH="$PATH:$dir" ;;
        esac
    done
}

## Add mysql to $PATH
path_add "/usr/local/mysql/bin/"

## Add luarocks bin to path
path_add "$HOME/.luarocks/bin/"

## Setup GOPATH
export GOPATH=$HOME/go
path_add "$GOPATH/bin"

export PATH

if [[ -z "${NVM_DIR}" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

alias ffprobe_size="ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1"
alias ffprobe_resolution="ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0"

export FFMPEGARGS="-c:v libx264 -crf 24 -preset slow -c:a aac -b:a 128k"
