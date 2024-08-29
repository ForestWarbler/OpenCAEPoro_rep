import re
# 指定天数
days = [50, 180, 360, 720, 1080, 1440, 1800, 2160, 2520, 2880, 3240, 3600]
def is_float(s: str):
    try:
        float(s)
        return True
    except ValueError:
        return False
    
def extract_row1(file_path, days):
    res = {}
    with open(file_path, 'r') as file:
        lines = file.readlines()
        for line in lines:
            if "Row 2" in line:
                break
            parts = line.strip().split()
            if len(parts) == 0:
                continue
            if not is_float(parts[0]):
                continue
            if len(parts) >= 10:  # 确保行中有足够的列
                day = float(parts[0])
                fpr = float(parts[3])
                fopr = float(parts[5])
                fgpr = float(parts[7])
                fwpr = float(parts[9])
                day = int(round(day))  # 将天数转换为整数

                if day in days:
                    res[day] = [fpr, fopr, fgpr, fwpr]
    return res

def extract_row2(file_path, days):
    res = {}
    is_row2 = False
    with open(file_path, 'r') as file:
        lines = file.readlines()
        for line in lines:
            if "Row 2" in line:
                is_row2 = True
                continue
            if not is_row2:
                continue
            parts = line.strip().split()
            if len(parts) == 0:
                continue
            if not is_float(parts[0]):
                continue
            if len(parts) >= 8:  # 确保行中有足够的列
                day = float(parts[0])
                inje1 = float(parts[6])
                prod1 = float(parts[7])
                day = int(round(day))  # 将天数转换为整数

                if day in days:
                    res[day] = [inje1, prod1]
    return res

def calculate_metric(fpr_values, ref_values, days):
    metrics = {day: [] for day in days}
    count = 0

    for day in days:
        if day in fpr_values and day in ref_values:
            for i in range(6):  # 遍历 FPR, FOPR, FGPR, FWPR, INJE1, PROD1
                diff = (fpr_values[day][i] - ref_values[day][i])**2 / ref_values[day][i]
                metrics[day].append(diff)
            count += 1

    if count > 0:
        # 计算每个指标的平均值
        avg_metrics = [sum(metric_list) / count for metric_list in zip(*metrics.values())]
        return avg_metrics
    else:
        return None

# 读取文件并提取FPR值
out_path = './data/case1/SUMMARY.out'
ref_path = './data/case1/SUMMARY_ref.out'
fpr_values = extract_row1(out_path, days)
ref_values = extract_row1(ref_path, days)

# 提取Row 2数据并合并到fpr_values和ref_values中
row2_values_out = extract_row2(out_path, days)
row2_values_ref = extract_row2(ref_path, days)

for day in days:
    if day in fpr_values and day in row2_values_out:
        fpr_values[day].extend(row2_values_out[day])
    if day in ref_values and day in row2_values_ref:
        ref_values[day].extend(row2_values_ref[day])

# 输出原先的结果和Row 2数据
for day in days:
    if day in fpr_values and day in ref_values:
        print(f"Day {day}:\tFPR = {fpr_values[day][0]} FOPR = {fpr_values[day][1]} FGPR = {fpr_values[day][2]} FWPR = {fpr_values[day][3]} INJE1 = {fpr_values[day][4]} PROD1 = {fpr_values[day][5]}")
        print(f"Ref:\t\tFPR = {ref_values[day][0]} FOPR = {ref_values[day][1]} FGPR = {ref_values[day][2]} FWPR = {ref_values[day][3]} INJE1 = {ref_values[day][4]} PROD1 = {ref_values[day][5]}")
    else:
        print(f"Day {day}: Data not found")

# 计算并判断是否满足公式
metrics = calculate_metric(fpr_values, ref_values, days)
if metrics is not None:
    print(f"METRICS: {metrics}")
    result = ["PASS" if metric < 0.01 else "FAIL" for metric in metrics]
    print(result)
else:
    print(["FAIL", "FAIL", "FAIL", "FAIL", "FAIL", "FAIL"])
