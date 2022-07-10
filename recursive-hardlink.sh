#!/bin/bash

# Author: Ben Stokman <ben.stokman@protonmail.com>
# Title: Recursive hardlinker
# Description: This program will create another hardlinked copy of any files in a directory
#              recursively.
# Usage: ./recursive-hardlink.sh <source directory> <final directory>

# ==================================================================================================
# WARNING: This software will NOT protect you if you do something wrong, you must make sure you are
#          using it correctly. Your source and final directories need to be on the same level. For
#          example If your final directory is in your Downloads folder, this script will NOT create
#          a subfolder to put all the files in. This command does NOT work like the cp command.
# ==================================================================================================

# $1 Source directory
# $2 Final Directory

# Defining editable variables
sdir="$1"
fdir="$2"

sdirlength=${#sdir}

# Cleaning up directory formatting if needed
# (Making sure the trailing / is there)
if [ ${sdir:(-1)} != "/" ];
then
	sdir+="/"
fi

if [ ${fdir:(-1)} != "/" ];
then
	fdir+="/"
fi

# Creating directories
mkdir -p "$fdir"

while IFS='' read -r -d '' i; do
	ndir="${i:$sdirlength}"
	ndir="${ndir:1}"
	mkdir -p "$2/$ndir"
done < <(find "$1" -type d -print0)

# Hardlinking files
while IFS='' read -r -d '' i; do
	ndir="${i:$sdirlength}"
	nfile="${ndir:1}"
	ln "$sdir$nfile" "$fdir$nfile"
done < <(find "$1" -type f -print0)

exit
