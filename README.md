# bashlilly
A Bash scripting function library by Mark Nenadov (2015) - marknenadov@gmail.com

Installation
------------

There are two install scripts, one which installs from local files (install.sh), the other which grabs the master from github (install-from-github.sh).

Both methods install to /usr/local/lib/bashlilly (if /usr/local/lib exists) or /usr/lib/bashlilly (if /usr/lib/ exists) or /bashlilly

```
chmod a+x install.sh
./install.sh
````

or

```
chmod a+x install-from-github.sh
./install-from-github.sh
```

Usage
-----

To include bashlilly in a script, do the following:

`source "/path/to/bashlilly.sh"`

Reference Documentation
-----------------------

For reference documentation, please consult the Markdown files (*.md) in the "docs" folder.
