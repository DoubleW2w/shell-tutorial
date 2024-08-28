<!--idoc:ignore:start-->

# Shell Tutorial

<!--idoc:ignore:end-->

记录自己学习 Shell 脚本的过程，参考资料如下：

[shell-tutorial](https://github.com/jaywcjlove/shell-tutorial)

[Bash Scripting Tutorial](https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/#how-to-run-bash-commands-from-the-command-line) 其中这篇文章里提供了练习环境, [Replit](https://replit.com/~)，它是一个基于浏览的 IDE，你只需要一点点的小操作就能启动一个 bash shell 进行练习。

<!--idoc:ignore:start-->

[TOC]

<!--idoc:ignore:end-->

## 脚本运行




以 `#!` 开头，告知系统该文件的执行需要一个解释器。

```sh
#!/bin/sh
#!/bin/bash
#!/usr/bin/perl
#!/usr/bin/tcl
#!/bin/sed -f
#!/usr/awk -f
```

给脚本添加权限


```sh
chmod +x 1_hello_world.sh # 给文件添加执行权限
chmod u+x 1_hello_world.sh # 使脚本文件拥有者有执行的权限
chmod ug+x 1_hello_world.sh # 只有文件拥有者以及同一组可以执行，其它人不能执行
chmod 777 1_hello_world.sh # 给文件最高权限
```


运行脚本

```sh
#方式1
sh 1_hello_world.sh
#方式2
bash 1_hello_world.sh
bash +x 1_hello_world.sh
```

## 特殊字符

以 `#` 开头的行就是注释，会被解释器忽略。

### 注释符号 `#`

```sh
echo "这里的 # 不会被注释"
echo '这里的 # 不会被注释'
echo 这里的 \# 不会被注释
echo 这里的 # 会被注释

echo ${PATH#*:}       # 前面的#是参数代换，不是注释.
echo $(( 2#101011 ))  # 基本转换，不是注释.

```

### 命令分隔符 `;`

分号 `;` 命令分割符，分割符允许在同一行里有两个或更多的命令。

```sh
echo hello; echo there         # 输出 hello 和 there

```

### 结束符 `;;`

双分号 `;;`，case 语句分支的结束符。

```sh
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
```



## 运算符



### 赋值运算符

### 算术运算符

### 位运算符

### 比较运算符

| 运算符 | 英文全称         | 中文描述   | 示例                  |
|--------|------------------|------------|-----------------------|
| `-eq`  | equal            | 等于       | [ 1 -eq 1 ] 为 true   |
| `-ne`  | not equal        | 不等于     | [ 1 -ne 1 ] 为 false  |
| `-gt`  | greater than     | 大于       | [ 2 -gt 1 ] 为 true   |
| `-lt`  | lesser than      | 小于       | [ 2 -lt 1 ] 为 false  |
| `-ge`  | greater or equal | 大于或等于 | [ 2 -ge 1 ] 为 tbnrue |
| `-le`  | lesser or equal  | 小于或等于 | [ 2 -le 1 ] 为 false  |

### 逻辑运算符

| 运算符 | 描述          | 等价使用 | 具体说明      |
|--------|---------------|----------|---------------|
| `&&`   | 逻辑与（AND） | `-a`     | 需两个为 True |
| `      |               | `        | 逻辑或（OR）  | `-o` | 其中之一为 True |



## 分支与循环控制

- 双中括号 ` [[ ... ]]` 结构

在 bash 中，引入 `[[ ... ]]` 扩展测试命令。这种方式一般直接使用数学符号判断时使用。

```sh
if [[ "$1" > "$2" ]];then
```

- 双圆括号 `((...))` 结构

允许进行算术扩展和赋值。例如：`a=$(( 5 + 3 ))`。



### if

if 语法

```sh
if [ condition ];then
    command1
    command2
    ...
fi # 注意不能少了fi结尾
```

if-else

```sh
if [ condition ];then
    command1
    command2
    ...
else
    command3
```

if 嵌套

```sh
if [ condition1 ];then
    if [ condition2 ];then
        command1
        ...
    fi
fi
```



### for 循环

语法格式

```sh
# [list] 是一个列表，类似list1 list2 list3 ... listN
for arg in [list];do #如果do和for在同一行，则注意中间加个分号
    command1
    command2
    ...
done
```

具体案例

```sh
# 方式 1
for i in {1..4};do # 类似python中使用in的方式判断
    echo "This is No $i"
done

# 方式 2
for((i=1;i<=5;i++));do # 类似C语言风格来实现
    echo "This is No $i"
done
```

### while 循环

```sh
while [ condition ];do
    command1
    command2
    ...
done
```

```sh
while ((a <= b));do
    ((sum+=a))
    ((a++))
done
echo "the plus is : $sum"
```

### until 循环

在循环的顶部判断条件，如果 condition 为 `False`，就进入循环，和 while 语句相反。

语法格式：

```sh
until condition;do # 如果condition为True，直接结束循环
    command1
    command2
    ...
done
```

```sh
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
```

###  break 和 continue 语句

- break 直接跳出循环
- continue 只跳过本次循环，忽略本次循环剩余代码，直接进入下一次循环。

### case 语句

语法格式：

```sh
case arg/expression in
    condition_1)
        command_1
    ;;
    condition_2)
        command_2
    ;;
    ......
    condition_N)
        command_N
    ;;
    *)
        command
esac
```
具体案例：

[8_case_statements.sh](./8_case_statements.sh)

## 变量

### 自定义变量基本语法

- **定义变量**：`变量名=变量值`

- **设置变量**：`set 变量名=变量值`
- **使用变量**：$变量名

## 函数

### 定义

语法：

```sh
# 方式 1
function func_name(){ # function在shell中专门定义函数
    command1
    command2
    ...
    [return value]
}

# 方式 2 : 简化写法
function_name(){
    command1
    command2
    ...
    [return value]
}
```
- 关键字function可有可无。
- 不用在函数中指明参数，只需在调用时传递参数即可。

### 函数调用

```sh
func_name [param_1] [param_2] ... [param_N]
```


## I/O重定向

## 正则表达式


## Linux / shell中一些命令说明

## grep 命令

## sed 命令

## awk 命令

## shell脚本静态检查 --- shellcheck