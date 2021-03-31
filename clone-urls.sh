#!/bin/bash
wd=`pwd`
sed -i 's/[ ]*//g' depository-urls.txt
for path in `cat depository-urls.txt`
do
cd "${wd}"
dir=${path#*//git\.banmamedia\.net\/FE\-HK/}

#if [ -d "$dir.git" ];then
#  echo "文件存在,删除文件${dir}.git"
#  rm -rf "$dir.git"
#  else
#  echo "文件不存在"
#fi

if [ ! -x "$dir" ]; then
echo "创建文件: 项目位置 ${wd}/${dir}, 文件目录${dir}"
#mkdir -p "$dir"
#cd "$dir"
#deletepath=`pwd`
#rm -rf "${deletepath}"
#cd ..
echo "运行: git clone ${path}.git."
git clone --mirror "${path}"
cd "$dir.git"
git push --mirror "https://git.jxnewbook.cn/old-project/${dir}"
cd ..
echo "克隆成功，项目位置${wd}/${dir}."
fi

if [ -d "$dir.git" ];then
  echo "文件存在,删除文件${dir}.git"
  rm -rf "$dir.git"
  else
  echo "文件不存在"
fi

done
