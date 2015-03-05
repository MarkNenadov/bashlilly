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

mkdir $INSTALL_DIR

cp $BASHLILLY_DIR/bashlilly.sh $INSTALL_DIR
cp $BASHLILLY_DIR/README.md $INSTALL_DIR
cp $BASHLILLY_DIR/LICENSE $INSTALL_DIR

mkdir $INSTALL_DIR/src
mkdir $INSTALL_DIR/docs

cp $BASHLILLY_DIR/src/*.sh $INSTALL_DIR/src/
cp $BASHLILLY_DIR/docs/*.md $INSTALL_DIR/docs/

echo "bashlilly has been installed to $INSTALL_DIR"
