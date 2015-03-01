# bashlilly
A Bash scripting function library by Mark Nenadov (2015) - marknenadov@gmail.com

Usage
-----

To include bashlilly in a script, do the following:

`source "/path/to/bashlilly.sh"`

Functions
---------

exists

-> does a (regular) file exist?

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

-> does a (regular) file exist and another (regular) file not exist?

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
-> A "do no harm" move function which returns "true" if the move occurred or "false" if it didn't

Sample Script:

```
#!/bin/bash

source "/usr/local/bashlilly/bashlilly.sh"

if safe_move /home/bob/user_list.txt /home/bob/user_list.txt.old; then
	echo "yay. we moved the file"
fi
```
