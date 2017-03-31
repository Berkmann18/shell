#!/bin/bash

sudo fdisk -l /dev/$1
sudo mkdir /media/usb
sudo mount /dev/$1 /media/usb
sudo mount | grep $1
