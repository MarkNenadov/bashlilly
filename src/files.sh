# bashlilly - A Bash scripting function library
#
# by Mark Nenadov (2015)
# marknenadov@gmail.com
#
# LICENSING
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version
# This program is distributed in the hope that it will be useful
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>. 
#
###File Functions
###--------------
###
###exists( fileToCheck )
###
###-> does a (regular) file exist?  (returns 0 if true, 1 otherwise)
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if exists /home/bob/user_list.txt; then
###	echo "yup"
###fi
###```
###
###---
function exists() {
	if [ ! $# -eq 1 ]; then
		wrong_parameter_message 1 "the file to check"
                return 1
        fi
	local thisFile="$1"

	if [ -f "$thisFile" ]; then
		return 0
	fi

	return 1
}

###this_exists_but_not_that( thisFile thatFile )
###
###-> does a (regular) file exist and another (regular) file not exist?  (returns 0 if true, 1 otherwise)
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if this_exists_but_not_that /tmp/1 /tmp/2; then
###	echo "yup"
###fi
###```
###
###---

function this_exists_but_not_that() {
        if [ ! $# -eq 2 ]; then
   		wrong_parameter_message 2 "this file, that file"
                return 1
        fi

	local thisFile="$1"
	local thatFile="$2"

	if exists $thisFile; then
		if ! exists $thatFile; then
			return 0
		fi
	fi

	return 1
}

###safe_move( fromFile toFile ) 
###
###-> A "do no harm" move function (returns 0 if the file was moved, 1 otherwise)
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if safe_move /home/bob/user_list.txt /home/bob/user_list.txt.old; then
###	echo "yay. we moved the file"
###fi
###```
###
###---

function safe_move() {
        if [ ! $# -eq 2 ]; then
                wrong_parameter_message 2 "from file, to file"
                return 1
        fi
	

	local fromFile="$1"
	local toFile="$2"

	if this_exists_but_not_that $fromFile $toFile; then
		mv ${fromFile} ${toFile}
	
		if this_exists_but_not_that $toFile $fromFile; then
			return 0
		fi
	fi

	return 1
}

###equivalent( file1, file2 )
###
###-> are the contents of two files equivalent?
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if equivalent file1.txt file2.txt; then
###	echo "yay. we the contents of the two files match"
###fi
###
###```
###
###---

function equivalent() {
	if [ ! $# -eq 2 ]; then
		wrong_parameter_message 2 "file 1, file 2"
		return 1
	fi

	local file1="$1"
	local file2="$2"

	if diff $file1 $file2 > /dev/null; then
		return 0
	fi

	return 1
}

###copy_in_dir( dir fromFile toFile )
###
###-> Copy a file from and to a dir (apply dir prefix to both from and to)
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if copy_in_dir /home/bob/ test1.txt test2.txt; then
###	echo "yay. we copied a file within /home/bob/"
###fi
###```
###---

function copy_in_dir() {
	if [ ! $# -eq 3 ]; then
		wrong_parameter_message 3 "prefix, from file, to file"
		return 1
	fi

	local prefix="$1"
	local fromFile="$2"
	local toFile="$3"

	if dir_exists "$prefix"; then
		if exists "$prefix/$fromFile"; then
			/bin/cp $prefix/$fromFile $prefix/$toFile
			if equivalent $prefix/$fromFile $prefix/$toFile; then
				return 0
			fi
		fi
	fi

	return 1
}

###backup( file )
###
###-> backup a file (file.bak or file.bak.{timestamp} if it already exists)
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###backup /home/joe/test.xml
###
###```
###---

function backup() {
	if [ ! $# -eq 1 ]; then 
		wrong_parameter_message 1 "the file to backup"
		return 1
	fi

	local fileToBackup="$1"
	local backupFile="$fileToBackup.bak"
	if exists $fileToBackup; then
		if exists $backupFile; then
			local timestamp=$( date +%s )
			backupFile=${backupFile}.$timestamp
		fi
		/bin/cp $fileToBackup $backupFile
	fi
}

###remove_carriage_returns( file )
###
###-> remove junk windows carriage returns from a file (useful for bash scripts and many other cases)
###
###Sample Script
###
###```
###remove_carriage_returns /home/ed/from_windows.txt
###```
###
###---

function remove_carriage_returns() {
	if [ ! $# -eq 1 ]; then
		wrong_parameter_message 1 "the file to remove carriage returns from"
	fi

	local workingFile="$1"

	if exists "$workingFile"; then
		cat ${workingFile} | tr -d "\r" > ${workingFile}
		return 0
	fi

	return 1
}

###append( fromFile toFile )
###
###-> append the contents of one file to another (checks existence of from file and checks writable status of to file)
###-> returns 0 for success / 1 for fail
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if append /home/mark/from.txt /home/mark/to.txt; then
###	echo "successfully appended from.txt to to.txt"
###fi
###
###```
###
###---

function append() {
	if [ ! $# -eq 2 ]; then
		wrong_parameter_message 2 "the file to append from, the file to append to"
	fi

	local appendFrom="$1"
	local appendTo="$2"

	if [ -w "$appendTo" ]; then
		cat $appendFrom >> ${appendTo}
		return 0
	fi

	return 1
}

