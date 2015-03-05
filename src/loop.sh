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

###Looping Functions
###-----------------


###loop( command, count )
###
###-> loop a command x times
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
###loop whoami 7
###```
###
###---

function loop() {
	if [ ! $# -eq 2 ]; then
		wrong_parameter_message 2 "the command, loop count"
	fi

	local cmd="$1"
	local loopCount=$2

	for i in $(seq 1 $loopCount)
	do
		${cmd}
	done
}

###loop_with_delay( command, count, delay )
###
###-> loop a command x times with a y second delay between
###
###Sample Script:
###
###```
###source "/usr/local/bashlilly/bashlilly.sh"
###
#### run whoami seven times with a five second delay between
###loop whoami 7 5
###```
###
###---

function loop_with_delay() {
	if [ ! $# -eq 3 ]; then
		wrong_parameter_message 3 "the command, loop count, delay"
	fi

	local cmd="$1"
	local loopCount=$2
	local delay=$3

	for i in $(seq 1 $loopCount)
	do
		$cmd
		sleep $delay
	done
}
