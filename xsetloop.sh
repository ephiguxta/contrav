#!/usr/bin/env bash

get_date() {
   # informações sobre o horário atual
   info=$(date +'%H:%M:%S')

   echo -e "$info"
}

func_names=('get_date')

while true; do

   # executando todas as funções que obtém dados
   # e atribuindo no old_string uma por vez.
   for i in ${func_names[@]}; do
      bar_string+="[$(${i})]"
   done

   xsetroot -name "$bar_string"

   unset bar_string

   sleep 1
done
