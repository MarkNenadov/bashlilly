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

function exec_where_available() {
        cmd="$1"
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

