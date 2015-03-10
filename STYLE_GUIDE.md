#Bashlilly Developer Style Guide

##General

* Baselilly functions should be used wherever possible (ie. so use exists instead of -f and dir_exists itstead of -d)
* Commands should not end with a ";" unless, for whatever reason, multiple commands are on one line

##Conditional Logic

* Simple if statements using bashlilly functions should be expressed like so:

```
if exists $thisFile; then
	[..]
fi
```

* More complex if statements can be expressed like so with the logic wrapped in square brackets:

```
if [ ! $# -eq 2 ]; then
	[...]
fi
```

##Functions

###Declaration

* Names should be lowercase with words separated by underscores
* Always use an explicit "function" keyword
* No empty line after "{" or before "}"

### Variables

* Functions should almost always only create local variables (with the "local" keyword), except in exceptional cases where it is essential
* Local variables should start with a lowercase letter and then be titlecase from there on
* In general, there shouldn't be too many more local variables than there are paramters

### Parameters

* Numbered parameters should be loaded into local variables before being used (for clarity)
* Parameter count should be enforced (where there is a not-variable number of parameters expected). Use wrong_parametr_message function to output error

### Return values

* Strive to have every function return 0 for success and 1 for failure

###Documentation

* Documentation for each function should be directly above the function in Markdown format on lines beginning with "###"

