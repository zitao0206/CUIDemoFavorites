#!/bin/sh
# 获取位置
pwdPath="$( cd "$( dirname "$0"  )" && pwd  )"
echo "当前文件位置 $pwdPath"

if [ ! $1 ]; then
    read -r -p "Please input your fileName: " className
    sh ClassMake/vc_classMake.sh $className $pwdPath
    sh ClassMake/view_classMake.sh $className $pwdPath
else
    sh ClassMake/vc_classMake.sh $1 $pwdPath
    sh ClassMake/view_classMake.sh $1 $pwdPath
fi

pod install
