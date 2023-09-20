#!/bin/bash

if [ ! $1 ]; then
    read -r -p "Please input your fileName: " input
    xcrun simctl io booted recordVideo /Users/lizitao/Desktop/Projects/CUIDemoFavorites/LocalPods/CUIDemoExamples/Resources/Videos/Dynamic/$input.mov
else
    xcrun simctl io booted recordVideo /Users/lizitao/Desktop/Projects/CUIDemoFavorites/LocalPods/CUIDemoExamples/Resources/Videos/Dynamic/$1.mov
fi


