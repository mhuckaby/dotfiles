#!/usr/bin/env zsh

set -e

FILES_ALL=('.bash_profile_functions' '.bash_profile_vc' '.gitignore_global' '.vimrc' '.zshrc')

handle_backup_files() {
  BACKUP=$(date +%s)
  DIR_BACKUP=~/.dotfiles.orignal/${BACKUP}

  mkdir -p ${DIR_BACKUP}

  for file in ${FILES_ALL[@]}; do
    PATH_BU_SRC=~/${file}
    PATH_BU_DEST=${DIR_BACKUP}/${file}

    if [ -f ${PATH_BU_SRC} ]; then
      cp ${PATH_BU_SRC} ${PATH_BU_DEST}
    fi
  done
}

handle_bash_profile_inclusion() {
  PATH_BASH_PROFILE=~/.bash_profile

  if [ ! -f ${PATH_BASH_PROFILE} ]
  then
    touch ${PATH_BASH_PROFILE}
  fi

  HIT=$(cat ~/.bash_profile | grep ". .bash_profile_vc" | xargs)
  if [ -z "${HIT}" ]
  then
    echo ". .bash_profile_vc" >> ~/.bash_profile
  fi
}

handle_copy_files_vc() {
  for file in ${FILES_ALL[@]}; do
    PATH_DF_SRC=./${file}
    PATH_DF_DEST=~/${file}

    cp ${PATH_DF_SRC} ${PATH_DF_DEST}
  done
}

handle_backup_files
handle_copy_files_vc
handle_bash_profile_inclusion
