# CUIDemoFavorites

[![CI Status](https://img.shields.io/travis/Leon0206/CUIDemoFavorites.svg?style=flat)](https://travis-ci.org/Leon0206/CUIDemoFavorites)
[![Version](https://img.shields.io/cocoapods/v/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![License](https://img.shields.io/cocoapods/l/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![Platform](https://img.shields.io/cocoapods/p/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Introduction to the project
CUIDemoFavorites means 'Custom User Interface Demo Favorites', that are used to collect all kinds of custom UI elements.

工程里含有两个Pod仓库，如下：
1. CUIDemoElements主要包含demo元素的代码，也就是真正的demo代码要放到这里；
2. CUIDemoExamples主要包含对应的demo演示示例代码，在这里CUIDemoElements中的demo将会被实例化以及各种case的使用场景介绍等，推荐用代码来诠释你的demo元素；
3. 如果要在你自己的项目中直接引用，可以 使用 pod 'CUIDemoElements'，当然强烈不推荐这么做，因为demo代码没人会保证它的安全性。

There are two Pods in the project, as follows: 
1. CUIDemoElements mainly contain the code of demo elements, that is, the actual demo code should be put here; 
2. CUIDemoExamples mainly contain the corresponding demos code, here the demos in CUIDemoElements will be instantiated and various case scenarios are introduced, it is recommended to use code to interpret your demo elements; 
3. If you want to reference it directly in your own project, you can use pod 'CUIDemoElements', although this is highly discouraged because demo code is not guaranteed to be secure.

## Steps and methods:

1. Find your own demo classification. For example, if your demo is an animated view, put your code CUIXXXAnimationView into the ViewAnimation directory corresponding to CUIDemoElements. 
It is better to create your own directory CUIXXXAnimationView; 
2. CUIDemoExamples, add your own demonstration example class CUIXXXAnimationViewController, it should contain your CUIXXXAnimationView initialization, the use of various scenarios such as any users need to know the code; 
3. In CUIDemoExamples, put the prepared demo Videos or pictures into the videos or Images directory; 
4. In CUIDemoExamples, find the CUIDemoViewAnimationData class and refer to add your own model, including class name, resource file name to be demonstrated, file format, author, presentation VC class, necessary description; 
5. pod install/pod update check the installation.

## Statement

The code is basically from the author's actual development, part of the code may come from other platforms of "model modification", if there is infringement, please inform in time, will be deleted in time.

## 作者与Email

zitao0206, 634376133@qq.com
