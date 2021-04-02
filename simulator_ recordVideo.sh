#!/bin/bash

read -r -p "Please input your Video fileName: " input

xcrun simctl io booted recordVideo CUIDemoExamples/Assets/Videos/$input.mov
