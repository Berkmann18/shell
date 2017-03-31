#!/bin/bash

sudo dpkg -i $1.deb
sudo apt-get install -f

#Or
#mv $1 /var/cache/apt/archives
#sudo apt-get install $1

#Or rclick on $1.deb and open with gdebi