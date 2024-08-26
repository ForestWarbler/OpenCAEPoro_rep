#!/bin/bash

# 定义文件路径
file1="./SUMMARY_ref.out"
file2="./SUMMARY.out"

# 定义需要的行和列范围
n=6      # 第6行
m1=81    # 起始列
m2=91    # 结束列

# 提取第n行的m1到m2列组成的科学计数法数字
extract_number() {
    local file=$1
    local row=$2
    local start_col=$3
    local end_col=$4

    # 提取指定行并从第start_col到end_col的字符组成数字
    number=$(sed -n "${row}p" "$file" | cut -c${start_col}-${end_col})

    echo "$number"
}

# 从两个文件中分别提取第6行的第54列到65列组成的科学计数法数字
number1=$(extract_number "$file1" $n $m1 $m2)
number2=$(extract_number "$file2" $n $m1 $m2)

# 调试输出，检查提取的数值
echo "提取的数值1: $number1"
echo "提取的数值2: $number2"

# 使用awk进行计算
awk -v num1="$number1" -v num2="$number2" '
BEGIN {
    # 转换科学计数法数值为浮点数并计算差值
    diff = num2 - num1
    abs_diff = (diff < 0) ? -diff : diff

    # 输出结果
    printf "文件 %s 和 %s 中，第 %d 行的第 %d 列到第 %d 列组成的科学计数法数值：\n", ARGV[1], ARGV[2], ARGV[3], ARGV[4], ARGV[5]
    printf "    数值1: %s\n", num1
    printf "    数值2: %s\n", num2
    printf "    差值: %f\n", diff
    printf "    绝对差值: %f\n", abs_diff
}' "$file1" "$file2" $n $m1 $m2
