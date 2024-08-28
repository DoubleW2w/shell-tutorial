#!/bin/bash
# 使用read命令读取用户输入
echo "What is your name?"
read name
echo "Hello $name"

# 读取文件 txt文件如果只有一行的情况下，不会输出
while read -r line
do
  echo "$line"
done < 4_input.txt

# 读取命令行参数 $1 表示传递的第一个参数
echo "Hello $1! Nice to meet you!"