#!/bin/bash

unetbootin method=diskimage isofile=$1 installtype=USB targetdrive=/dev/$2
