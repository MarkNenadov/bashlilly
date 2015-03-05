#!/bin/bash

source "bashlilly.sh"

function extract_markdown() {
	local inFile="src/$1"
	local outFile="docs/$2"

	cat ${inFile}|grep "###"|sed 's/\#\#\#//g'  > ${outFile}
}

if dir_exists "docs"; then
	rm docs/*
else
	mkdir docs
fi

extract_markdown "base.sh" "base_functions.md"
extract_markdown "files.sh" "file_functions.md"
extract_markdown "dirs.sh" "directory_functions.md"
extract_markdown "loop.sh" "looping_functions.md"
extract_markdown "exec.sh" "execution_functions.md"
