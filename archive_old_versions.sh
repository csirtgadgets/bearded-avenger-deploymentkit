#!/bin/bash

ARCHIVE_DB=$1
DB=/var/lib/cif/cif.db

if [ -d /usr/local/lib/python2.7/dist-packages ]; then
    echo 'removing old cif|cifsdk files..'
    rm -rf `find /usr/local/lib/python2.7/dist-packages | egrep "(cif-|cifsdk-)+"`

    if [ "$ARCHIVE_DB" == "1" ]; then
      if [ -f "$DB" ]; then
        echo "archiving old cif db"
        mv "$DB" "$DB.old"
      fi
    fi
fi