#!/bin/bash
# Made with love by Sören Reinecke (Trufi Association e.V.)

# Requirements:
#  - pbzip2
#  - tar

# Inspiration:
#   - https://github.com/komoot/photon
#   - https://download1.graphhopper.com/public/extracts/

# Environment variables to declare:
#   - country

# Example declaration of Environment variables:
#country=de

# Script begins
url="https://download1.graphhopper.com/public/extracts/by-country-code/" # Url template

echo "checking if a country has been specified..."
if [ -z "$country" ];
then
	echo -e "  \033[0;31mNo country specified to download the extract for. Exiting script...\033[0;m"
	exit 1
fi;

echo "country has been specified, proceeding with download..."
filename="photon-db-$country-latest.tar.bz2"
wget $url/$country/$filename

echo "download finish, checking if file exists..."
if [ -d "$filename" ];
then
	echo -e "  \033[0;31mAn error while downloading from $url/$country/$filename occurred\033[0;m"
	exit 2
fi;

echo "file exists, extracting..."
pbzip2 -cd $filename | tar x
exitcode=$?
echo "Extraction finish, execution finish"
exit $exitcode # return the exit code of the tar command
