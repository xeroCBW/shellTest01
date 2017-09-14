#!/bin/bash

#1.没有参数的函数
function fun1 (){

	echo "helloWorld"
	echo "this is fun1"
}

#运行第一行代码
fun1

echo "-------------------------"

#2.有参数函数
function func2()
{
    echo "This is func2"

    a=$1
    b=$2
    echo "a is : $a"
    echo "b is : $b"
}
#调用函数2
func2 "aaa" "bbb"

echo "-------------------------"

#3.变量作用域,local限制在函数内,没有local默认是全局的
function func3(){

#注意=左右不要打空格
	globalValue="我是全局变量"
	local localValue="我是本地变量"

	echo $globalValue
	echo $localValue
}

func3
echo "func3 调用完成...,看结果并不会打印出localValue"
echo $globalValue
echo $localValue

echo "-------------------------"
#4.默认是字符串
function func4(){

	#字符串操作1:默认就是字符串
str1=hello
str2='hello'
str3="hello"

echo str1
echo str2
echo str3

}

func4

echo "-------------------------"
#5.获取字符串的长度
function func5(){

#获取字符串的长度
stringLengthTest="hello world"
echo "stringLengthTest length: ${#stringLengthTest}"

}

func5

echo "-------------------------"
#6.字符串拼接
function func6(){

#字符串拼接
#
str1="hello"
str2="world"

str3=${str1}"+"${str2}
echo ${str3}

str4=$str1$str2
echo $str4

}

func6

echo "-------------------------"
#7.原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
#注意使用的是反引号 ` 而不是单引号 '
function func7 (){

	a=1
	b=2
	c=`expr $a + $b`
	echo $c
}
func7

echo "-------------------------"
#8.数组操作-直接初始化
#初始化时不需要指定数组的大小
function func8(){
echo "格式一"
my_arr=(1 2 3)
# 遍历数组格式1
echo "my_arr: ${my_arr[*]}"
#获取数组长度
echo "my_arr length: ${#my_arr[*]}"

echo "格式二"
# 遍历数组格式2
echo "my_arr: ${my_arr[@]}"
#获取数组长度
echo "my_arr length: ${#my_arr[@]}"

echo "获取数组某个元素"
echo "第1个元素: ${my_arr[1]}"

echo "数组赋值"
my_arr[0]=a
my_arr[1]=b
my_arr[223]=c # 不连续初始化
echo "my_arr: ${my_arr[@]}"

}

func8



