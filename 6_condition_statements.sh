#!/bin/bash

# 条件语句  if-else  if-elif-else

# if [[ condition ]];
# then
#     statement
# elif [[ condition ]]; then
#     statement
# else
#     do this by default
# fi

echo "please input a number"
read num

if [ "$num" -gt 0 ]; then
  echo "$num is positive"
elif [ "$num" -lt 0 ]; then
  echo "$num is negative"
else
  echo "$num is zero"
fi