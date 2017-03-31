#!/bin/bash
od -tx1 $1 | cut -c8-100 | sed -e 's/ /\\x/g'