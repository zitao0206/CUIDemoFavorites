#!/bin/bash
git status
sleep 2

git add -A

echo "-------Begin-------"

git commit -am "Add New Codes."

git push

echo "--------End--------"
