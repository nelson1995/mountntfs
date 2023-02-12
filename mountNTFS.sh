#!/bin/bash

mount_ntfs () {
   #display details of disks and their disk id
   sudo fdisk -l
   printf "\nEnter the disk indentifier e.g disk1, disk2 >"
   read diskID

   sudo mkdir /Volumes/NTFS_Drive
   sudo mount -t ntfs -o rw /dev/$diskID /Volumes/NTFS_Drive
   
   return 0
}

pathOfDisk=`which fdisk`

#check if fdisk is installed on computer
if [ -z "$pathOfDisk" ] 
then
  : printf "\nFdisk not installed.Now installing fdisk..."
    sudo apt-get install -y fdisk
    while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; 
    do
      sleep 1
    done
      mount_ntfs
else
    mount_ntfs
fi

