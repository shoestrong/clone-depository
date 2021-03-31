#!/bin/bash
wd=`pwd`
sed -i 's/[ ]*//g' depository-urls.txt
for path in `cat depository-urls.txt`
do
cd "${wd}"
dir=${path#*//gitee\.com/Shoestrong/}

if [ ! -x "$dir" ]; then
echo "运行: git clone ${path}.git."
git clone --mirror "${path}"
cd "$dir.git"
git push --mirror "https://github.com/shoestrong/${dir}"
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
