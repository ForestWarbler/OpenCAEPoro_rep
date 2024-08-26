#!/bin/bash

# 定义文件路径
file="./SUMMARY.out"

# 定义需要检测的行和列范围
start_row=6
end_row=338
check_start_col=6
check_end_col=13
compare_start_col=42
compare_end_col=52

# 定义目标值列表（作为字符串数组）
target_values=("50.000" "180.000" "360.000" "720.000" "1080.000" "1440.000" "1800.000" "2160.000" "2520.000" "2880.000" "3240.000" "3600.000")

# 初始化sum1
sum1=0

# 提取指定列组成的数字
extract_number() {
    local file=$1
    local row=$2
    local start_col=$3
    local end_col=$4

    # 提取指定行并从start_col到end_col的字符组成数字
    number=$(sed -n "${row}p" "$file" | cut -c${start_col}-${end_col})
    
    # 删除可能的空格
    number=$(echo $number | tr -d ' ')

    echo "$number"
}

# 检查是否为目标值
is_target_value() {
    local num=$1
    for value in "${target_values[@]}"; do
        # 使用awk比较浮点数是否相等
        if echo "$num $value" | awk '{if ($1 == $2) print "yes"; else print "no"}' | grep -q "yes"; then
            return 0  # 是目标值
        fi
    done
    return 1  # 不是目标值
}

# 遍历每一行进行检查
for ((row=start_row; row<=end_row; row++)); do
    # 从 SUMMARY.out 中提取第 6 到 13 列的数字
    check_number=$(extract_number "$file" $row $check_start_col $check_end_col)

    # 检查数字是否在目标列表中
    if is_target_value "$check_number"; then
        echo "在第 $row 行，检测到目标值 $check_number，提取并累加54到64列的数值："
        
        # 提取并累加第54到64列的数字
        number=$(extract_number "$file" $row $compare_start_col $compare_end_col)
        
        # 将提取的数值转换为浮点数并累加到sum1中
        sum1=$(echo "$sum1 $number" | awk '{print $1 + $2}')
    fi
done

# 输出最终的sum1结果
echo "总和 sum1: $sum1"
