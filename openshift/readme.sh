#!/bin/bash

FILE="README.md"

echo "# Openshift related stuff" > $FILE
echo "What is in this git repository?" >> $FILE
ls | grep -v ".txt" | grep -v ".md" | grep -v ".sh" | awk '{print "- "$1}' >> $FILE
