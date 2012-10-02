#!/bin/sh

# Requires GNU Coreutils for stat(1) and perl for relative paths
# Works with posh, should work with any POSIX-compliant shell


SRC="$(pwd)"
DST="$HOME"
FFLAG=0
VFLAG=0

usage() {
  echo >&2 "Usage: $0 [-vf]"
  echo >&2 "\t-v  Be more verbose"
  echo >&2 "\t-f  Force removal of existing files"
  exit 1
}

linkfile() {
  # Link "$1" from "$DST" to "$SRC"
  # Abort if the file already exists as something other than the correct link
  # unless $FFLAG is set, to force us to remove it.
  if [ $# == 2 ]; then
      dst=${DST}/${2}
      src=${SRC}/${1}
  elif [ $# == 1 ]; then
      dst=${DST}/${1}
      src=${SRC}/${1}
  else
      echo >&2 "SOMETHING HAS GONE HORRIBLY WRONG!"
      echo >&2 "Not Enough Arguments, or too many!"
      return
  fi

  (cd $DST && ln -sf "$src" "$dst")

}


while getopts vf flag; do
  case "$flag" in
    v)   VFLAG=$(($VFLAG+1)) ;;
    f)   FFLAG=$(($FFLAG+1)) ;;
    [?]) usage ;;
  esac
done

shift $(($OPTIND-1))

[ $# != 0 ] && usage

cat links | sed -e '/\s*#/d' -e '/^\s*$/d' | while read file; do
  echo "$file"
  linkfile $file
done
