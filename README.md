# CUIDemoFavorites

[![CI Status](https://img.shields.io/travis/Leon0206/CUIDemoFavorites.svg?style=flat)](https://travis-ci.org/Leon0206/CUIDemoFavorites)
[![Version](https://img.shields.io/cocoapods/v/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![License](https://img.shields.io/cocoapods/l/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![Platform](https://img.shields.io/cocoapods/p/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)

## Operating:

Clone the repo, and run `pod install` first, then run the CUIDemoFavorites.xcworkspace.

## Introduction to the project:
CUIDemoFavorites means 'Custom User Interface Demo Favorites', that are used to collect all kinds of custom UI elements.

There are three Pods in the project, as follows: 
1. CUIDemoElements mainly contain the code of demo elements, that is, the actual demo code should be put here; 
2. CUIDemoExamples mainly contain the corresponding demos code, here the demos in CUIDemoElements will be instantiated and various case scenarios are introduced, it is recommended to use code to interpret your demo elements; 
3. CUIDemoBackups mainly contain the history demos that will be reorganized gradually. 

If you want to reference it directly in your own project, you can use pod 'CUIDemoElements', although this is highly discouraged because demo code is not guaranteed to be secure.

## Steps and methods:

1. Find your own demo classification. For example, if your demo is an animated view, put your code CUIXXXAnimationView into the ViewAnimation directory corresponding to CUIDemoElements. 
It is better to create your own directory CUIXXXAnimationView; 
2. CUIDemoExamples, add your own demonstration example class CUIXXXAnimationViewController, it should contain your CUIXXXAnimationView initialization, the use of various scenarios such as any users need to know the code; 
3. In CUIDemoExamples, put the prepared demo Videos or pictures into the videos or Images directory; 
4. In CUIDemoExamples, find the CUIDemoViewAnimationData class and refer to add your own model, including class name, resource file name to be demonstrated, file format, author, presentation VC class, necessary description; 
5. pod install/pod update check the installation.

## Statement:

The code is basically from the author's actual development, part of the code may come from other platforms of "model modification", if there is infringement, please inform in time, will be deleted in time.

## Author and Email:

zitao0206, 634376133@qq.com
