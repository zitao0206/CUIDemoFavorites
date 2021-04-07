#!/bin/sh
# 获取位置
pwdPath="$( cd "$( dirname "$0"  )" && pwd  )"
echo "当前文件位置 $pwdPath"

targetPath="CUIDemoExamples/Classes/ViewControllers"
echo "目标位置 $targetPath"

read -r -p "Please input your fileName: " className

fileType1="Controller.h"
fileType2="Controller.m"
classType="Controller"
viewControllerName="${className}${classType}"
fileName1="${className}${fileType1}"
fileName2="${className}${fileType2}"
allPath="${pwdPath}/${targetPath}/${className}"
allName1="${pwdPath}/${targetPath}/${className}/${fileName1}"
allName2="${pwdPath}/${targetPath}/${className}/${fileName2}"
echo "完整路径： $allPath"
echo "完整文件： $allName1"
echo "完整文件： $allName2"

inputText1="//\n//  ${fileName1}\n//  Pods\n//\n//  Created by Leon on 04/02/2021.\n//\n\n@interface ${viewControllerName} : UIViewController\n\n@end"
inputText2="//\n//  ${fileName2}\n//  Pods\n//\n//  Created by Leon on 04/02/2021.\n//\n\n#import \"${fileName1}\"\n\n@interface ${viewControllerName} ()\n\n@end\n\n@implementation ${viewControllerName} \n\n - (void)viewDidLoad\n{\n    [super viewDidLoad];\n\n}\n\n- (void)viewWillLayoutSubviews\n{\n    [super viewWillLayoutSubviews];\n\n}\n\n@end\n"

if [ -f "$allName1" ]
then
    echo "文件已经存在"
    exit 0
else
    echo "不存在"
    # 创建目录在当前的位置
    mkdir ${allPath}
    # 创建文件在当前的位置
    touch ${allName1}
    touch ${allName2}
fi
 
if [ -f "$allName1" ]
then
    # 覆盖内容
    # echo "$inputText" > "$allName"
    # 添加内容
    echo "$inputText1" >> "$allName1"
fi

if [ -f "$allName2" ]
then
    # 覆盖内容
    # echo "$inputText" > "$allName"
    # 添加内容
    echo "$inputText2" >> "$allName2"
fi


pod install
