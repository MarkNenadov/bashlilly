# bashlilly
A Bash scripting function library by Mark Nenadov (2015) - marknenadov@gmail.com

Usage
-----

To include bashlilly in a script, do the following:

`source "/path/to/bashlilly.sh"`

Functions
---------

exists

-> does a (regular) file exist?  (returns 0 if true, 1 otherwise)

Sample Script:

```
#!/bin/bash

source "/usr/local/bashlilly/bashlilly.sh"

if exists /home/bob/user_list.txt; then
	echo "yup"
fi
```

---

this_exists_but_not_that

-> does a (regular) file exist and another (regular) file not exist?  (returns 0 if true, 1 otherwise)

Sample Script:

```
#!/bin/bash

source "/usr/local/bashlilly/bashlilly.sh"

if this_exists_but_not_that /tmp/1 /tmp/2; then
	echo "yup"
fi
```

---

safe_move 
-> A "do no harm" move function (returns 0 if the file was moved, 1 otherwise)
Sample Script:

```
#!/bin/bash

source "/usr/local/bashlilly/bashlilly.sh"

if safe_move /home/bob/user_list.txt /home/bob/user_list.txt.old; then
	echo "yay. we moved the file"
fi
```

---

exec_where_available

-> attempt to execute a command first in /bin/, then /usr/bin/, then /usr/local/bin/ (avoiding path settings)

Sample Script:

```
#!/bin/bash

source "/usr/local/bashlilly/bashlilly.sh"

if exec_where_available vi; then
	echo "we found vi somewhere in /bin, /usr/bin/ or /usr/local/bin and ran it"
fi
```