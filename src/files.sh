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

function exists() {
        if [ ! $# -eq 1 ]; then
                echo "Must provide 1 argument (the file to check)"
                return 1
        fi

	local thisFile="$1"

	if [ -f "$thisFile" ]; then
		return 0
	fi

	return 1
}

function this_exists_but_not_that() {
        if [ ! $# -eq 2 ]; then
                echo "Must provide 2 arguments (this file, that file)"
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

function safe_move() {
        if [ ! $# -eq 2 ]; then
                echo "Must provide 2 arguments (from file, to file)"
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

function backup() {
	if [ ! $# -eq 1 ]; then 
		echo "Must provide 1 argument (the file to backup)"
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
