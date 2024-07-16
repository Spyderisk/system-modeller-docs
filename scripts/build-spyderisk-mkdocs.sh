#!/bin/bash

## 
## Copyright 2024 The Spyderisk Licensors
##
##   Licensed under the Apache License, Version 2.0 (the "License");
##   you may not use this file except in compliance with the License.
##   You may obtain a copy of the License at:
##
##       http://www.apache.org/licenses/LICENSE-2.0
##
##   Unless required by applicable law or agreed to in writing, software
##   distributed under the License is distributed on an "AS IS" BASIS,
##   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##   See the License for the specific language governing permissions and
##   limitations under the License.
##
## <!-- SPDX-License-Identifier: Apache 2.0 -->
## <!-- SPDX-FileCopyrightText: 2024 The Spyderisk Licensors -->
## <!-- SPDX-ArtifactOfProjectName: Spyderisk -->
## <!-- SPDX-FileType: Source code -->
## <!-- SPDX-FileComment: Original by Panos Melas, Dan Shearer July 2024 -->

# The purpose of this script is to do an anonymous git pull of Spyderisk docs,
# and then for each branch tagged in the form "v3.5.0" to indicate a release, 
# run mkdocs from https://mkdocs.org to regenerate the docs for that release. 
# Regenerating each time means that new configurations or versions of mkdocs
# are used, and pulling freshly from git each time means that there is less 
# chance of a versioning/tagging mixup or corruption. It would be possible to
# optimise for less processing but at higher risk of errors, so we don't do that.
#
# This script is intended to run from systemd/cron at regular intervals.
#
# Don't run this script as root, there is absolutely no need.
#
# Algorithm summary:
#
#   clone to $REPO_DIR/$REPO_NAME
#   for each release version in $TAG
#      generate mkdocs tree in $REPO_DIR/$OUTPUT_DIR/$TAG
#   move $REPO_DIR/$OUTPUT_DIR to wherever the webserver expects to find trees

echo "Start Spyderisk docs build script"

# Directory of the Git repository
# Note! Change this to suit your local installation.
REPO_DIR="/var/spyderisk-docs"
REPO_NAME="system-modeller-docs"
TMP_NAME=$(mktemp /tmp/`basename $0`.XXXXX)
OUTPUT_DIR="/var/spyderisk-docs/www/html"
OUTPUT_DIR="/code/www/html"

ErrorExit() {
	if [[ -f /tmp/$TMP_NAME/* ]]; then   # clean up mktemp output in /tmp
		rm "/tmp/$TMP_NAME/*"
	fi
	echo "`basename $0`:  Error exit: $1"
	exit 1
}

if [[ $(id -u) -eq 0 ]]; then
    #ErrorExit "Do not run as root!"
    echo "WARN do not run as root"
fi

# Check hard coded place for git instead of using the path
GIT="/usr/bin/git"
if [[ ! -f $GIT ]]; then
	ErrorExit "git does not exist on this machine"
fi

MKDOCS="/usr/local/bin/mkdocs"
if [[ ! -f $MKDOCS ]]; then
	ErrorExit "mkdocs does not exist on this machine"
fi

if [[ ! -d $REPO_DIR ]]; then
    mkdir -p $REPO_DIR
    #ErrorExit "Top level $REPO_DIR does not exist: did you set it correctly in the script?"
else
	echo "write test" > $REPO_DIR/write_test
	if [[ ! $? ]]; then
		ErrorExit "Top level $REPO_DIR exists but is not writable"
        else
                rm $REPO_DIR/write_test
	fi
fi

cd $REPO_DIR

if [ -d "$REPO_DIR/$REPO_NAME" ]; then
    rm -rf $REPO_NAME
fi

if [ -d "$OUTPUT_DIR" ]; then
    find $OUTPUT_DIR -mindepth 1 -not -name 'index.html' -delete
fi

$GIT clone https://github.com/Spyderisk/$REPO_NAME.git || ErrorExit "Git clone failed"
$GIT config --global --add safe.directory $REPO_DIR/$REPO_NAME

cd $REPO_NAME
TAGS=$($GIT tag 2>&1)
#TAGS="v3.7.8"

# Compare the tags and detect new ones
for i in $TAGS; do

    if [[ $i =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        git checkout  # $i
        mkdir -p $OUTPUT_DIR/$i
        $MKDOCS build -d /$OUTPUT_DIR/$i
        echo "Built Spyderisk docs for version $i"

        (
            cd $OUTPUT_DIR
            if [ -L latest ]; then
                rm latest
            fi
            ln -s "$i" latest
        )
    fi

done

echo "Spyderisk docs built for versions $TAGS"

# insert code herex to move each $i from $REPO_DIR/$OUTPUT_DIR/$i to websever dir

echo "End Spyderisk docs build script"
