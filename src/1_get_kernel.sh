#!/bin/sh

# Grab everything after the '=' sign
DOWNLOAD_URL=$(grep -i KERNEL_SOURCE_URL .config | cut -f2 -d'=')

# Grab everything after the last '/'
ARCHIVE_FILE=${DOWNLOAD_URL##*/}

cd source

# Downloading kernel file
# -c option allows the download to resume
wget -c $DOWNLOAD_URL

# Delete folder with previously extracted kernel
rm -rf ../work/kernel
mkdir ../work/kernel

# Extract kernel to folder 'kernel'
# Full path will be something like, kernel\linux-3.16
tar -xvf $ARCHIVE_FILE -C ../work/kernel

cd ..
