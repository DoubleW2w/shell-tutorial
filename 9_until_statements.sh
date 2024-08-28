#!/usr/bin/env bash

#程序使用C语言风格，如果使用shellcheck是会直接报错
i=1
sum=0
until ((i > 50)); do
  ((sum += i))
  ((i++))
done
echo "The puls is : $sum"

i=1
sum=0
until [[ i -gt 50 ]]; do
  ((sum += i))
  ((i++))
done
echo "The puls is : $sum"
