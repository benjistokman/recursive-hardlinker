# Bash Recursive Hard-linker

Bash script that creates another hard-linked copy of any files in a directory recursively.

Usage: `bash recursive-hardlink.sh "<source directory>" "<final directory>"`

Example: `bash recursive-hardlink.sh "/home/user/Downloads/cat-pictures" "/home/user/Pictures/cats"`

**WARNING**: This software will NOT protect you if you do something wrong, you must make sure you are using it correctly. Your source and final directories need to be on the same level. For example If your final directory is in your Downloads folder, this script will NOT create a subfolder to put all the files in. This command does NOT work like the `cp` command