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


BASHLILLY_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source "${BASHLILLY_DIR}/src/base.sh"
source "${BASHLILLY_DIR}/src/loop.sh"
source "${BASHLILLY_DIR}/src/exec.sh"
source "${BASHLILLY_DIR}/src/dirs.sh"
source "${BASHLILLY_DIR}/src/files.sh"
source "${BASHLILLY_DIR}/src/process.sh"
source "${BASHLILLY_DIR}/src/init.sh"
