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

###Base Functions
###--------------
###
###wrong_parameter_message( count description )
###
###-> Indicate that the wrong number of parameters have been provided to a function
###
###Sample Script:
###
###```
###function test() {
###        if [ ! $# -eq 2 ]; then
###                wrong_parameter_message 2 "from file, to file"
###                return 1
###        fi
###}
###```

function wrong_parameter_message() {
	local count="$1"
	local description="$2"
	
	echo "Must provide $count argument(s) ($description)"
}
