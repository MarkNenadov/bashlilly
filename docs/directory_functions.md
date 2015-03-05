Directory Functions
-------------------

dir_exists( dir )

-> does a directory exist?

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if dir_exists /home/mark/myfolder; then
	echo "yup. it is there"
fi

```
----
recreate_dir( dir )

-> delete a dir and then make an empty one in its place

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

recreate_dir /home/jill

```
---
