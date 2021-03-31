# clone-depository
Clone from one depository to another

从一个仓库克隆到另一仓库

```
#!/bin/bash
wd=`pwd`
sed -i 's/[ ]*//g' depository-urls.txt
for path in `cat depository-urls.txt`
do
cd "${wd}"
# 如果使用，更改自己的源，需要反转义
dir=${path#*//gitee\.com/Shoestrong/}

# 去clone文件
if [ ! -x "$dir" ]; then
echo "运行: git clone ${path}.git."
# clone创建镜像
git clone --mirror "${path}"
cd "$dir.git"
# push镜像到目标源 可以更改自己源
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

```
