#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

backup(){
  if [ -f "$HOME/.vimrc.bak" ] || [ -d "$HOME~/.vim" ]; then
    echo "backups already present, refusing to continue" || return 1
  fi

  if [ -f "$HOME~/.vimrc" ]; then
    mv $HOME/.vimrc{,.bak} || return 1
  fi

  if [ -f "$HOME~/.vim" ]; then
    mv $HOME/.vim{,.bak} || return 1
  fi
}

install() {
  ln -nsf "$DIR/vimrc" "$HOME/.vimrc"
}

main(){
  backup \
  && install
}
main "$@"
