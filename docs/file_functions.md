File Functions
--------------

exists( fileToCheck )

-> does a (regular) file exist?  (returns 0 if true, 1 otherwise)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if exists /home/bob/user_list.txt; then
	echo "yup"
fi
```

---
this_exists_but_not_that( thisFile thatFile )

-> does a (regular) file exist and another (regular) file not exist?  (returns 0 if true, 1 otherwise)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if this_exists_but_not_that /tmp/1 /tmp/2; then
	echo "yup"
fi
```

---
safe_move( fromFile toFile ) 

-> A "do no harm" move function (returns 0 if the file was moved, 1 otherwise)
Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if safe_move /home/bob/user_list.txt /home/bob/user_list.txt.old; then
	echo "yay. we moved the file"
fi
```

---
equivalent( file1, file2 )

-> are the contents of two files equivalent?

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if equivalent file1.txt file2.txt; then
	echo "yay. we the contents of the two files match"
fi

```

---
copy_in_dir( dir fromFile toFile )

-> Copy a file from and to a dir (apply dir prefix to both from and to)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if copy_in_dir /home/bob/ test1.txt test2.txt; then
	echo "yay. we copied a file within /home/bob/"
fi
```
---
backup( file )

-> backup a file (file.bak or file.bak.{timestamp} if it already exists)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

backup /home/joe/test.xml

```
---
remove_carriage_returns( file )

-> remove junk windows carriage returns from a file (useful for bash scripts and many other cases)

Sample Script

```
remove_carriage_returns /home/ed/from_windows.txt
```

---
append( fromFile toFile )

-> append the contents of one file to another (checks existence of from file and checks writable status of to file)
-> returns 0 for success / 1 for fail

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if append /home/mark/from.txt /home/mark/to.txt; then
	echo "successfully appended from.txt to to.txt"
fi

```

---
