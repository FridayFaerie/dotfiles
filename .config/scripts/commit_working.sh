#!/usr/bin/env sh

if [ -z "$1" ]; then
  echo "you need a commit message :/"
  exit 1
fi

git switch main &&

git merge working --squash &&

git commit -m "${1}" &&

git push

git switch working &&

git merge main -m "merged from main"
