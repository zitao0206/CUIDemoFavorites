#!/bin/bash

if [ ! $1 ]; then
    read -r -p "Please input your fileName: " input
    xcrun simctl io booted recordVideo CUIDemoExamples/Assets/$input.mov
else
    xcrun simctl io booted recordVideo CUIDemoExamples/Assets/$1.mov
fi


