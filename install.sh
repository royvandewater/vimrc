#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
export SHELL="/bin/bash"

backup(){
  if [ -f "$HOME/.vimrc.bak" ] || [ -d "$HOME~/.vim.bak" ]; then
    echo "backups already present, refusing to continue" || return 1
  fi

  if [ -f "$HOME~/.vimrc" ]; then
    mv $HOME/.vimrc{,.bak} || return 1
  fi

  if [ -d "$HOME~/.vim" ]; then
    mv $HOME/.vim{,.bak} || return 1
  fi
}

install_vim_files(){
  ln -nsf "$DIR/vimrc" "$HOME/.vimrc" \
  && mkdir -p "$HOME/.vim"
}

install_vundle(){
  git clone \
      "https://github.com/VundleVim/Vundle.vim.git" \
      "$HOME/.vim/bundle/Vundle.vim"
}

update_vundle(){
  $DIR/update.sh
}

install() {
  install_vim_files \
  && install_vundle \
  && update_vundle
}

main(){
  backup \
  && install
}
main "$@"
