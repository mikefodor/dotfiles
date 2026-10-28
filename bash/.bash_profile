shopt -s globstar

export EDITOR='nvim'
PS1='\n─────┬─\u@\h:\W : \t [$?]\n╰──\$ '
export XDG_CONFIG_HOME="$HOME/.config"

[ -d ~/.config/bash/pmg_work ] && export IS_PMG_WORK=1

# Make sure bash 5 is in /etc/shells.  This may not actually work because
# it needs to authenticate for sudo
if [ "$(grep -c "/opt/homebrew/bin/bash" /etc/shells)" == 0 ]; then
  echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells;
fi

# Add colors to ls output
eval "$(gdircolors)"
alias ls="gls --color=auto"

alias ll="ls -l"
alias cdgitroot='cd $(git rev-parse --show-toplevel)'
alias cdvault="cd ~/vaults/ObsidianVault/"

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
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

source $XDG_CONFIG_HOME/bash/ffmpeg.sh

[ -n $IS_PMG_WORK ] && source $XDG_CONFIG_HOME/bash/pmg_work/init.sh
