#!/usr/bin/env bash

get_date() {
   # informações sobre o horário atual

   local info
   info=$(date +'%H:%M:%S')

   echo -e "[${info}]"
}

get_brightness() {
   # valor literal do brilho da tela
   # obs: funciona apenas no intel

   #TODO: suporte a outras GPUs

   local path
   local info

   path='/sys/class/backlight/intel_backlight/brightness'
   info=$(<${path})

   echo -e "[${info}]"
}

get_battery_info() {
   # algumas informações sobre a bateria e
   # estado de alimentação

   local info
   local path
   local capacity
   local power_supply

   path='/sys/class/power_supply/BAT1'
   capacity="${path}/capacity"
   power_supply="${path}/status"

   info="[$(<${power_supply})]"
   info+=" [$(<${capacity})%]"

   echo -e "$info"
}

func_names=(
            'get_battery_info'
            'get_brightness'
            'get_date'
)

while true; do

   # executando todas as funções que obtém dados
   # e atribuindo no old_string uma por vez.
   for i in ${func_names[@]}; do
      bar_string+=" $(${i})"
   done

   xsetroot -name "$bar_string"

   unset bar_string

   sleep 1
done
