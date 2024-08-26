#!/bin/bash

# files
file_out="./data/case1/SUMMARY.out"
file_ref="./data/case1/SUMMARY_ref.out"

# total number of rows
tot_rows=12

# rows
row1_out=(38 82 151 229 269 283 293 302 311 320 329 338)
row1_ref=(38 82 151 235 275 289 306 315 324 333 342 351)
row2_out=(376 420 489 567 607 621 631 640 649 658 667 676)
row2_ref=(389 433 502 586 626 640 657 666 675 684 693 702)
row1_m=(42 68 94 120)
row1_n=(52 78 104 130)
row2_m=(81 94)
row2_n=(91 104)

# extract number
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

# compute
# row1
for ((j = 0; j < 4; j++)); do
    sum_unit=0
    for ((i = 0; i < 12; i++)); do
        number_out=$(extract_number $file_out ${row1_out[i]} ${row1_m[j]} ${row1_n[j]})
        number_ref=$(extract_number $file_ref ${row1_ref[i]} ${row1_m[j]} ${row1_n[j]})
        # echo "row1: ${row1_m[j]}, ${row1_n[j]}, $number_out, $number_ref"
        # 使用awk计算diff_sq和unit_diff，并将结果累加到sum_unit_total
        sum_unit=$(awk -v out="$number_out" -v ref="$number_ref" -v sum="$sum_unit" '
            BEGIN {
                diff_sq = (out - ref) * (out - ref)
                unit_diff = diff_sq / ref
                sum += unit_diff
                print sum
            }')
    done
    # calculate the average of unit_diff
    avg_unit=$(awk -v sum="$sum_unit" 'BEGIN {print sum / 12}')
    echo "$avg_unit" | awk '
    BEGIN { threshold = 1e-2 }
    {
        if ($1 < threshold) {
            print "row1:", m, n, $1, "PASS"
        } else {
            print "row1:", m, n, $1, "FAILED"
        }
    }' m="${row1_m[j]}" n="${row1_n[j]}"
done

# row2
for ((j = 0; j < 2; j++)); do
    sum_unit=0
    for ((i = 0; i < 12; i++)); do
        number_out=$(extract_number $file_out ${row2_out[i]} ${row2_m[j]} ${row2_n[j]})
        number_ref=$(extract_number $file_ref ${row2_ref[i]} ${row2_m[j]} ${row2_n[j]})
        # echo "row2: ${row2_m[j]}, ${row2_n[j]}, $number_out, $number_ref"
        sum_unit=$(awk -v out="$number_out" -v ref="$number_ref" -v sum="$sum_unit" '
            BEGIN {
                diff_sq = (out - ref) * (out - ref)
                unit_diff = diff_sq / ref
                sum += unit_diff
                print sum
            }')
    done
    avg_unit=$(awk -v sum="$sum_unit" 'BEGIN {print sum / 12}')
    echo "$avg_unit" | awk '
    BEGIN { threshold = 1e-2 }
    {
        if ($1 < threshold) {
            print "row2:", m, n, $1, "PASS"
        } else {
            print "row2:", m, n, $1, "FAILED"
        }
    }' m="${row2_m[j]}" n="${row2_n[j]}"
done
