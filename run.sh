#!/bin/bash
echo "hello world :D !" 

# current date an hour :

DATE=$( date '+%F_%H:%M:%S' )
echo "Bash script starting at : $DATE"

# file path :

SCRIPT_PATH=$( realpath "$0" )
echo "Script full path : $SCRIPT_PATH"

# create a temporary directory to store temporary files :
# note : if custom name, add at least 3 "X" at the end to ensure uniqueness

TEMP_DIR=$( mktemp -d "temporary.XXXXXX" )

echo "Temporary directory created as $TEMP_DIR"

# dowloading the json from each urls inside urls.txt

