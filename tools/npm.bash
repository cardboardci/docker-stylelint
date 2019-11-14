#!/bin/bash
set -e

# Emit the current versions
echo "Current versions"
cat provision/nodelist

mv provision/nodelist provision/nodelist.bak
touch provision/nodelist
while read line; do
    echo "Working with ${line}"
    input=(${line//@/ })
    echo "Determining version for ${input}"
    version=$(npm show ${input} version)
    echo "Found version as ${version}"
    echo "${input}@${version}" >> provision/nodelist
done <provision/nodelist.bak

#
rm provision/nodelist.bak
cat provision/nodelist