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


# safe_move - Move a file with a "do no harm" strategy
# - example: safe_move from_file to_file
# - return: "true" or "false"

function safe_move() {
	local fromFile="$1"
	local toFile="$2"

	if [ -f "$fromFile" ]; then
		if [ ! -f "$toFile" ]; then
			mv ${fromFile} ${toFile}
	
			if [ ! -f "$fromFile" ]; then
				if [ -f  "$toFile" ]; then
					return 0
				fi
			fi
		fi
	fi

	return 1
}
