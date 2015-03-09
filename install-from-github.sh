#!/bin/bash

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source "$CURRENT_DIR/bashlilly.sh"

INSTALL_BASE=/usr/local/lib

if ! dir_exists $INSTALL_BASE; then
	INSTALL_BASE=/usr/lib

	if ! dir_exists $INSTALL_BASE; then
		INSTALL_BASE=
	fi
fi

INSTALL_DIR=$INSTALL_BASE/bashlilly/


INSTALL_DIR=$INSTALL_BASE/bashlilly/

if dir_exists $INSTALL_DIR; then
        rm -rf $INSTALL_DIR
fi

mkdir $INSTALL_DIR

wget "https://github.com/MarkNenadov/bashlilly/archive/master.zip"
unzip master.zip

cp bashlilly-master/README.md $INSTALL_DIR
cp bashlilly-master/LICENSE $INSTALL_DIR

mkdir $INSTALL_DIR/src
cp bashlilly-master/src/* $INSTALL_DIR/src/

rm -rf bashlilly-master
rm master.zip

echo "bashlilly has been downloaded from github and installed to $INSTALL_DIR"
