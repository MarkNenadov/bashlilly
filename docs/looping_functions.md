Looping Functions
-----------------
loop( command, count )

-> loop a command x times

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

loop whoami 7
```

---
loop_with_delay( command, count, delay )

-> loop a command x times with a y second delay between

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

# run whoami seven times with a five second delay between
loop whoami 7 5
```

---
