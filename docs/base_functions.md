Base Functions
--------------

wrong_parameter_message( count description )

-> Indicate that the wrong number of parameters have been provided to a function

Sample Script:

```
function test() {
        if [ ! $# -eq 2 ]; then
                wrong_parameter_message 2 "from file, to file"
                return 1
        fi
}
```
