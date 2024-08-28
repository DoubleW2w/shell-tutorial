#!/bin/bash

echo "Today is" `date`

echo "Today is$(date)"

echo -e "\n enter the path to directory"

read -r the_path

echo -e "your path has the following files and folders: "
ls "$the_path"