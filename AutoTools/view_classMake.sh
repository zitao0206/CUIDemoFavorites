#!/bin/sh
# 获取位置

if [ ! $1 ]; then
    read -r -p "Please input your fileName: " className
else
    className=$1
fi

pwdPath=$2
echo "当前文件位置 $2"

targetPath="CUIDemoElements/Classes/Views"
echo "目标位置 $targetPath"

filePrefix="CUI"
fileType1="View.h"
fileType2="View.m"
classType="View"
objName="${filePrefix}${className}${classType}"
fileName1="${filePrefix}${className}${fileType1}"
fileName2="${filePrefix}${className}${fileType2}"
allPath="${pwdPath}/${targetPath}/${className}"
allName1="${pwdPath}/${targetPath}/${className}/${fileName1}"
allName2="${pwdPath}/${targetPath}/${className}/${fileName2}"
echo "完整路径： $allPath"
echo "完整文件： $allName1"
echo "完整文件： $allName2"

inputText1="//\n//  ${fileName1}\n//  Pods\n//\n//  Created by Leon on $(date +"%d/%m/%Y").\n//\n\n@interface ${objName} : UIView\n\n@end"
inputText2="//\n//  ${fileName2}\n//  Pods\n//\n//  Created by Leon on $(date +"%d/%m/%Y").\n//\n\n#import \"${fileName1}\"\n\n@interface ${objName} ()\n\n@end\n\n@implementation ${objName} \n\n- (instancetype)initWithFrame:(CGRect)frame\n{\n    self = [super initWithFrame:frame];\n    if (self) {\n\n    }\n    return self;\n}\n\n- (void)layoutSubviews\n{\n    [super layoutSubviews];\n\n}\n\n@end\n"

if [ -f "$allName1" ]
then
    echo "文件已经存在!"
    exit 0
else
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
