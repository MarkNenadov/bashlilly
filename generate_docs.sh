#!/bin/bash

source "bashlilly.sh"

if dir_exists "docs"; then
	rm docs/*
else
	mkdir docs
fi

cat src/files.sh|grep "#~" > docs/file_functions.md
