 Execution Functions
 -------------------

run_where_available( cmd )

-> attempt to execute a command first in /bin/, then /usr/bin/, then /usr/local/bin/ (avoiding path settings)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if exec_where_available vi; then
	echo "we found vi somewhere in /bin, /usr/bin/ or /usr/local/bin and ran it"
fi
```
---
run_if_exists( cmd )

-> run a command if it exists as a file

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

run_if_exists /usr/bin/lala
```

---
run_if_file_exists( command, file )

-> run a command if another file exists

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

run_if_file_exists /usr/local/bin/send-package /home/mark/package.pkg
```

---
run_if_file_not_exists( cmd, file )

-> run a command if another file doesn't exist

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

run_if_file_not_exists /usr/local/bin/sourcegen /home/mark/source.src
```
---
