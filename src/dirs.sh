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

function dir_exists() {
        if [ ! $# -eq 1 ]; then
		wrong_parameter_message 1 "the dir to check"
                return 1
        fi

	local thisDir="$1"

	if [ -d "$thisDir" ]; then
		return 0
	fi

	return 1
}

function recreate_dir() {
	if [ ! $# -eq 1 ]; then
		wrong_parameter_message 1 "the dir to recreate"
		return 1
	fi

	local thisDir="$1"

	if dir_exists "$thisDir"; then
		rm -rf $thisDir
		mkdir $thisDir

		if dir_exists "$thisDir"; then
			return 0
		fi
	fi

	return 1
}

