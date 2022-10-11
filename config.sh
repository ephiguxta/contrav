#!/usr/bin/env bash

scripts='~/.scripts'
test -d "$scripts" &&  mkdir "$scripts"

cp -v xsetloop.sh ~/.scripts
