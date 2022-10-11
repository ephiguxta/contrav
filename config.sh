#!/usr/bin/env bash

scripts='~/.scripts'
test -d "$scripts" &&  mkdir "$scripts"

cp -v xsetloop.sh ~/.scripts

if test -e ~/.xinitrc ; then
   echo -e 'Já existe um .xinitrc configurado,
   \rdeseja sobrescrever? (S|N)'
   read opt

   [[ "$opt" =~ ^([SsYy]){1}$ ]] && {
      echo -e \
      'Sobrescrevendo e salvando o último xinitrc em /tmp'
      cp -v ~/.xinitrc /tmp/xinitrc_bkp

      cp -fv xinitrc ~/.xinitrc
      chmod u+x ~/.xinitrc
   }

else
   cp -v xinitrc "$xinitrc_path"
fi
