#!/bin/bash

# while 循环，从1+100
i=1
sum=0
while [[ $i -le 10 ]]; do
  (( sum += i ))
  (( i += 1 ))
done
# 输出总和
echo "while 循环 sum=$sum"


# for 循环
for (( ; i<=10; i++ )); do
  (( sum += i ))
done

# 输出总和
echo "for 循环 sum=$sum"