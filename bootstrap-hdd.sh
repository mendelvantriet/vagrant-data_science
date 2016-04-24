#!/usr/bin/env bash

function usage
{
	echo "usage: bootstrap-hdd.sh [[-d device] | [-h]]"
}

device=

while [ "$1" != "" ]; do
	case $1 in
		-d | --device )		shift
					device=$1
					;;
		-h | --help )		usage
					exit
					;;
		* )			usage
					exit 1
	esac
	shift
done

[ -z "$device" ] && usage && exit 1

sudo parted $device mklabel msdos
sudo parted $device mkpart primary 512 100%
sudo mkfs.ext4 ${device}1
sudo mkdir /media/data
UUID=$(sudo blkid ${device}1 | awk '{print$2}' | sed -e 's/"//g')
echo $UUID /media/data ext4 defaults,noatime 0 1 | sudo tee -a /etc/fstab

sudo mount /media/data
echo "Done"

