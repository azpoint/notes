#!/bin/bash
read -rp "Enter dir absolute path :" dir

find "$dir" -type d -exec chmod 760 {} \;
find "$dir" -type f -exec chmod 760 {} \;

echo "Done"
