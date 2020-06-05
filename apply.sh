#!/usr/bin/env bash

set -e

BACKUP_SUFFIX=$(date +%s)
DIR_BACKUP=~/.dotfiles.orignal

mkdir -p ${DIR_BACKUP}

allFiles=('.bash_profile' '.gitignore_global' '.vimrc' '.zshrc')

# Keep backup and apply loops separate - if any backup fails do not proceed with overwrite

for file in ${allFiles[@]}; do
  PATH_BU_SRC=~/${file}
  PATH_BU_DEST=${DIR_BACKUP}/${file}.${BACKUP_SUFFIX}

  cp ${PATH_BU_SRC} ${PATH_BU_DEST}
  echo "Backed up file ${PATH_BU_SRC} to ${PATH_BU_DEST}"
done

for file in ${allFiles[@]}; do
  PATH_DF_SRC=./${file}
  PATH_DF_DEST=~/${file}

  cp ${PATH_DF_SRC} ${PATH_DF_DEST}
  echo "Copied ${PATH_DF_SRC} to ${HOME}/${PATH_DF_DEST}"
done
