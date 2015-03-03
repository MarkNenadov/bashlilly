# bashlilly
A Bash scripting function library by Mark Nenadov (2015) - marknenadov@gmail.com

Installation
------------

There are two install scripts, one which installs from local files (install.sh), the other which grabs the master from github (install-from-github.sh).

Both methods install to /usr/local/lib/bashlilly (if /usr/local/lib exists) or /usr/lib/bashlilly (if /usr/lib/ exists) or /bashlilly

`./install.sh`

or

`./install-from-github.sh`

Usage
-----

To include bashlilly in a script, do the following:

`source "/path/to/bashlilly.sh"`

File Functions
--------------

exists

-> does a (regular) file exist?  (returns 0 if true, 1 otherwise)

Sample Script:

```
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
source "/usr/local/bashlilly/bashlilly.sh"

if safe_move /home/bob/user_list.txt /home/bob/user_list.txt.old; then
	echo "yay. we moved the file"
fi
```

---

equivalent 
-> are the contents of two files equivalent?

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if equivalent file1.txt file2.txt; then
	echo "yay. we the contents of the two files match"
fi

```

copy_in_dir 
-> Copy a file from and to a dir (apply dir prefix to both from and to)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if copy_in_dir /home/bob/ test1.txt test2.txt; then
	echo "yay. we copied a file within /home/bob/"
fi
```

backup

-> backup a file (file.bak or file.bak.{timestamp} if it already exists)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

backup /home/joe/test.xml

```

append

-> append the contents of one file to another (checks existence of from file and checks writable status of to file)
-> returns 0 for success / 1 for fail

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if append /home/mark/from.txt /home/mark/to.txt; then
	echo "successfully appended from.txt to to.txt"
fi

```

Execution Functions
-------------------

run_where_available

-> attempt to execute a command first in /bin/, then /usr/bin/, then /usr/local/bin/ (avoiding path settings)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if exec_where_available vi; then
	echo "we found vi somewhere in /bin, /usr/bin/ or /usr/local/bin and ran it"
fi
```

---

run_if_exists

-> run a command if it exists as a file

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

run_if_exists /usr/bin/lala
```

---

run_if_file_exists

-> run a command if another file exists

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

run_if_file_exists /usr/local/bin/send-package /home/mark/package.pkg
```

---

run_if_file_not_exists

-> run a command if another file doesn't exist

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

run_if_file_not_exists /usr/local/bin/sourcegen /home/mark/source.src
```

Looping Functions
-------------------

loop

-> loop a command x times

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

loop whoami 7
```

---

loop_with_delay

-> loop a command x times with a y second delay between

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

# run whoami seven times with a five second delay between
loop whoami 7 5
```

Directory Functions
-------------------

dir_exists

-> does a directory exist?

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if dir_exists /home/mark/myfolder; then
	echo "yup. it is there"
fi

```

----

recreate_dir

-> delete a dir and then make an empty one in its place

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

recreate_dir /home/jill

```
