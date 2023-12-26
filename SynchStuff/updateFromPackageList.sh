#! /bin/bash

sudo dpkg --clear-selections

if ! [ -f packages.txt ]; then 
    echo "no packages.txt! Run the updatePackageList.sh script, but it really should be there if you pulled everything right..."
    exit -1
fi

sudo apt install dselect

dselect update

sudo dpkg --set-selections < ./packages.txt

sudo apt-get dselect-upgrade


