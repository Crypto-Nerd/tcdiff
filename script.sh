#!/bin/bash

FILENAME=$1
NEWFILENAME=`echo $1 | sed 's/\.\//\.\.\/veracrypt_1\.17_Source\/src\//g'`
DIFFFILENAME=`echo $1.patch | sed 's/\.\//\.\.\/diff\//g'`

#echo $FILENAME $NEWFILENAME $DIFFFILENAME
diff -uB "$FILENAME" "$NEWFILENAME" | install -D /dev/stdin "$DIFFFILENAME"

