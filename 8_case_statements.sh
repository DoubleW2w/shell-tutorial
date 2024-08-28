#!/bin/bash

set -x # Bash 会将执行的每个命令打印到终端
set -e # 在脚本中的任何命令失败时立即退出

# case语句
i=1
case $i in
    1)
        echo "1"
        ;;
    2)
        echo "2"
        ;;
    3)
        echo "3"
        ;;
    *)
        echo "*"
        ;;
esac

if [ $? -ne 0 ]; then
    echo "Error occurred."
else
  echo "success"
fi