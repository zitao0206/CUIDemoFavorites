# CUIDemoFavorites

[![CI Status](https://img.shields.io/travis/Leon0206/CUIDemoFavorites.svg?style=flat)](https://travis-ci.org/Leon0206/CUIDemoFavorites)
[![Version](https://img.shields.io/cocoapods/v/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![License](https://img.shields.io/cocoapods/l/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![Platform](https://img.shields.io/cocoapods/p/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)

## Operating:

Clone the repo, and run `pod install` first, then run the CUIDemoFavorites.xcworkspace.

## Introduction to the project:
CUIDemoFavorites means 'Custom User Interface Demo Favorites', that are used to collect all kinds of custom UI elements.

There are two Pods in the project, as follows: 
1. CUIDemoElements mainly contain the code of demo elements, that is, the actual demo code should be put here; 
2. CUIDemoExamples mainly contain the corresponding demos code, here the demos in CUIDemoElements will be instantiated and various case scenarios are introduced, it is recommended to use code to interpret your demo elements; 

If you want to reference it directly in your own project, you can use pod 'CUIDemoElements', although this is highly discouraged because these demo codes have not been adequately tested and verified. They just give you some quick reference ideas.

## Steps and methods:

In order to facilitate management, there are some naming rules that need to be followed for newly created code classes and resource files. You only need to refer to the existing code.
1. Find your own demo classification. There are 3 categories here, namely 'Fundamental Elements', 'Static Views', 'Dynamic Views'.
2. CUIDemoExamples, add your own demonstration example classes, they should contain your XXXView initialization, the use of various scenarios such as any users need to know the code; 
3. In CUIDemoExamples, put the prepared demo Videos or pictures into the videos or Images directory; 
4. In CUIDemoExamples, find the CUIDemoXXXData class and refer to add your own data, including class name, resource file name to be demonstrated, file format, author, presentation VC class and necessary description; 
5. pod install/pod update check the installation.

## Statement:

The code is basically from the author's actual development, part of the code may come from other platforms of "model modification", if there is an infringement, please inform me in time, will be deleted in time.

## Author and Email:

zitao0206, 634376133@qq.com
