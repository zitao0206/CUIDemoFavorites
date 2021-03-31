# CUIDemoFavorites

[![CI Status](https://img.shields.io/travis/Leon0206/CUIDemoFavorites.svg?style=flat)](https://travis-ci.org/Leon0206/CUIDemoFavorites)
[![Version](https://img.shields.io/cocoapods/v/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![License](https://img.shields.io/cocoapods/l/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)
[![Platform](https://img.shields.io/cocoapods/p/CUIDemoFavorites.svg?style=flat)](https://cocoapods.org/pods/CUIDemoFavorites)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 工程的简介

工程里含有两个Pod仓库，如下：
1. CUIDemoElements主要包含demo元素的代码，也就是真正的demo代码要放到这里；
2. CUIDemoExamples主要包含对应的demo演示示例代码，在这里CUIDemoElements中的demo将会被实例化以及各种case的使用场景介绍等，推荐用代码来诠释你的demo元素；
3. 如果要在你自己的项目中直接引用，可以 使用 pod 'CUIDemoElements'，当然强烈不推荐这么做，因为demo代码没人会保证它的安全性。

## 入库步骤与方法：

1. 找到自己的demo分类，例如你的demo是个动画视图，那么现将你的代码CUIXXXAnimationView相关的代码放入CUIDemoElements对应的ViewAnimation目录下，
最好建个属于自己的目录CUIXXXAnimationView；
2. CUIDemoExamples中，添加自己的演示示例类CUIXXXAnimationViewController，里面应该包含你的CUIXXXAnimationView初始化，各种场景的使用等任何需要使用者知道的代码；
3. CUIDemoExamples中，将提前准备好的演示视频或者图片资源放入Videos或Images目录下；
4. CUIDemoExamples中，找到CUIDemoViewAnimationData类，参考添加自己的model，包括类名、将要演示的资源文件名、文件格式、作者、演示VC类、必要的描述；
5. pod install/pod update运行查看。

## 说明

代码基本都来自作者的实际自己开发中，部分代码可能来自其他平台的“模改”，如有侵权，请及时告知，会及时删除。

## 作者与邮件

Leon0206, 634376133@qq.com
