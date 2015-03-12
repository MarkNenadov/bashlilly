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
###Init script Functions
###--------------
###
###make_init( scriptFile, initdName )
###
###-> turn a script into an init script (copy it into /etc/init.d/, chmod it)
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###if make_init "/home/don/coyote coyote"; then
###	echo "yup. we've created the init script"
###fi
###```
###
###---
function make_init() {
	if [ ! $# -eq 2 ]; then
		wrong_parameter_message 2 "the script file, init script name"
                return 1
        fi
	local scriptFile="$1"
	local initdName="$2"

	if exists "$scriptFile"; then
		if ! exists "$initdName"; then
			cp $scriptFile /etc/init.d/$initdName;
			if exists "/etc/init.d/$initdName"; then
				chmod a+x /etc/init.d/$initdName
				return 0
			fi
		fi
	fi

	return 1
}

