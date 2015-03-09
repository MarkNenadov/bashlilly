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


### Process Functions
### -------------------
###
###psgrep( value )
###
###-> grep your processes (a shortcut to ps-ef|grep "value"
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###psgrep "apache"
###
###```
###---

function psgrep() {
        if [ ! $# -eq 1 ]; then
                wrong_parameter_message 1 "the value to grep"
                return 1
        fi

        local value="$1"

	ps -ef|grep "$value"|grep -v "00:00:00 grep"
}

