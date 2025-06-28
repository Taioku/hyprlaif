#!/bin/bash

updates=$(yay -Qu | wc -l)

if [ "$updates" -eq 0 ]; then
  echo "{\"text\": \"\", \"class\": \"uptodate\"}"
else
  echo "{\"text\": \"$updates \", \"class\": \"updates\"}"
fi

