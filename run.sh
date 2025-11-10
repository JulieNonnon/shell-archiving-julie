#!/bin/bash
echo "hello world :D !" 

# current date an hour :

DATE=$( date '+%F_%H:%M:%S' )
echo "Bash script starting at : $DATE"

# file path :
SCRIPT_PATH=$( realpath "$0" )
echo "Script full path : $SCRIPT_PATH"

# dowloading the json from each urls inside urls.txt

