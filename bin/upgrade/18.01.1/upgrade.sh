#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"

#enable command line
bash $DIR/scripts/detect.init.sh

#upgrade existing plugins
countly plugin upgrade crashes
countly plugin upgrade views
countly plugin upgrade users

#remove stuck push collections
nodejs $DIR/upgrade/18.01.1/scripts/push_clear.js

#add indexes
nodejs $DIR/scripts/add_indexes.js

#install dependencies, process files and restart countly
countly upgrade