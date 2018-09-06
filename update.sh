#!/bin/bash

export SHELL="/bin/bash"

main(){
  vim +BundleInstall! +BundleClean +qall
}
main "$@"
