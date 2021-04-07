#!/bin/bash

if [ ! $1 ]; then
    read -r -p "Please input your fileName: " input
    xcrun simctl io booted screenshot  CUIDemoExamples/Assets/$input.png
else
    xcrun simctl io booted screenshot  CUIDemoExamples/Assets/$1.png
fi
