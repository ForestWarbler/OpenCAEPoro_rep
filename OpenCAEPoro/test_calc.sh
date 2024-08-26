#!/bin/bash

# 定义两个科学计数法表示的数值
value1="4.79424e+03"
value2="4.79425e+03"

# 使用awk将科学计数法转换为普通浮点数格式
value1_float=$(echo "$value1" | awk '{printf "%f", $1}')
value2_float=$(echo "$value2" | awk '{printf "%f", $1}')

# 计算差值
diff=$(echo "$value2_float - $value1_float" | bc -l)

# 取绝对值
abs_diff=$(echo "$diff" | awk '{print ($1<0) ? -$1 : $1}')

# 输出结果
echo "数值1: $value1 ($value1_float)"
echo "数值2: $value2 ($value2_float)"
echo "差值: $diff"
echo "绝对差值: $abs_diff"
