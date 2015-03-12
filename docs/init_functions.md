Init script Functions
--------------

make_init( scriptFile, initdName )

-> turn a script into an init script (copy it into /etc/init.d/, chmod it)

Sample Script:

```
source "/usr/local/bashlilly/bashlilly.sh"

if make_init "/home/don/coyote coyote"; then
	echo "yup. we've created the init script"
fi
```

---
