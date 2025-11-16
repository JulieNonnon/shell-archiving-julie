#!/bin/bash


# ANSI code variables for url displays :
BLUE="\e[34m"
GREEN="\e[32m"
UNDERLINE="\e[4m"
RESET="\e[0m"


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


# condition to check if urls.txt exists :

if [ ! -f "urls.txt" ]; then
echo "urls.txt not found."
exit 1
fi


# while loop to read every url line inside urls.txt :

i=1
while IFS= read -r url; do


# skip empty lines :

if [ -z "$url" ]; then
continue
fi


# define output filenames with the respective country code :

filename=$(basename "$url")
output_path="$TEMP_DIR/$filename"


# downloading urls ( "-e" to read ANSI codes)

echo -e "Downloading: ${BLUE}${UNDERLINE}${url}${RESET} ..."


# dowloading the json from each urls inside urls.txt + storing their respective HTTP response headers

headers_path="$TEMP_DIR/${filename}.headers"

curl -s "$url" -o "$output_path" -D "$headers_path"

#curl -s "$url" -o "$output_path"

if [ $? -eq 0 ]; then
echo -e "${GREEN}Done${RESET} : $filename"
else
echo "Error while downloading : ${BLUE}${UNDERLINE}${url}${RESET}"
fi

((i++))

done < "urls.txt"

# //// FOR DEBUG PURPOSES //// :
#echo "All download completed !"
#echo "Files a availables in : $TEMP_DIR"


# creation of a "downloads" directory : 

DOWNLOAD_DIR="downloads"
mkdir -p "$DOWNLOAD_DIR"


# copy all .json files from temporary directory to the brand new downloads directory :

cp "$TEMP_DIR"/*.json "$DOWNLOAD_DIR"/

echo "Copying JSON files from ${TEMP_DIR} to ${DOWNLOAD_DIR} ..."
echo -e "${GREEN}Done${RESET}"


# compile all hearders into a unique file :

echo "Compiling HTTP response headers from ${TEMP_DIR} to ${DOWNLOAD_DIR} ..."

HEADERS_OUTPUT="${DOWNLOAD_DIR}/headers.txt"
> "$HEADERS_OUTPUT"   # empty or create the file


# loop through each .headers file in temp dir :

for headers_file in "$TEMP_DIR"/*.headers; do

    # Extract the filename only (ex: fr.json.headers)
    base_headers=$(basename "$headers_file")

    # Insert header marker
    echo "### ${base_headers}:" >> "$HEADERS_OUTPUT"

    # Append the content of the .headers file
    cat "$headers_file" >> "$HEADERS_OUTPUT"

    # Insert a blank line for readability
    echo "" >> "$HEADERS_OUTPUT"
done

echo -e "${GREEN}Done${RESET}"


# creation of a "archives" directory, in order to compress all files from downloads file into the archives file  : 

ARCHIVE_DIR="archives"
mkdir -p "$ARCHIVE_DIR"

echo "Compressing all files in ${DOWNLOAD_DIR} to ${ARCHIVE_DIR} ... "


# creation of the archive file (date '+%F_T%H-%M-%S' = date format as 2024-11-16_T10-45-32)

ARCHIVE_NAME="D$(date '+%F_T%H-%M-%S').tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"


# Compressing with tar -czf (for "create", "gzip" = good level of compression, "file") :

tar -czf "$ARCHIVE_PATH" -C "$DOWNLOAD_DIR" .
echo -e "${GREEN}Done${RESET} : ${ARCHIVE_NAME}"


# end of script with current date an hour :

DATE=$( date '+%F_%H:%M:%S' )
echo "Bash script starting at : $DATE"

echo "Bye !" 
