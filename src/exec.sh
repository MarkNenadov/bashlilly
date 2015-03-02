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

function run_where_available() {
        if [ ! $# -eq 1 ]; then
                wrong_parameter_message 1 "the command"
                return 1
        fi

        local cmd="$1"
        if exists /bin/$cmd; then
                echo "executing in /bin"
                return 0
        fi

        if exists /usr/bin/$cmd; then
                /usr/bin/$cmd
                return 0
        fi

        if exists /usr/local/bin/$cmd; then
                /usr/local/bin/$cmd
                return 0
        fi

        return 1
}

function run_if_exists() {
	if [ ! $# -eq 1 ]; then
                wrong_parameter_message 1 "the command"
                return 1
        fi

	local cmd="$1"

	if exists $cmd; then
		${cmd}
		return 0
	fi

	return 1

}

function run_if_file_exists() {
        if [ ! $# -eq 2 ]; then
                wrong_parameter_message 1 "the command, the file to check for"
                return 1
        fi

        local cmd="$1"
	local fileToCheckFor="$2"

        if exists $fileToCheckFor; then
                ${cmd}
                return 0
        fi

        return 1

}

function run_if_file_not_exists() {
        if [ ! $# -eq 2 ]; then
                wrong_parameter_message 1 "the command, the file to check for"
                return 1
        fi

        local cmd="$1"
        local fileToCheckFor="$2"

        if ! exists $fileToCheckFor; then
                ${cmd}
                return 0
        fi

        return 1
}

