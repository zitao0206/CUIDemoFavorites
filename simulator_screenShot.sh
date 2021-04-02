#!/bin/bash

read -r -p "Please input your Image fileName: " input

xcrun simctl io booted screenshot  CUIDemoExamples/Assets/Images/$input.png
