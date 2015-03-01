# bashlilly
A Bash scripting function library by Mark Nenadov (2015) - marknenadov@gmail.com

Usage
-----

To include bashlilly in a script, do the following:

`source "/path/to/bashlilly.sh"`

Functions
---------

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
