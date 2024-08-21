#!/bin/bash
#SBATCH --job-name=zhj  # 任务名称
#SBATCH --partition=mars  # 指定分区
#SBATCH --nodes=2  # 使用的节点数
#SBATCH --ntasks=2  # 使用的任务数
#SBATCH --cpus-per-task=64  # 每个任务使用的CPU核数
#SBATCH --time=02:00:00  # 任务运行的最长时间 (格式为 HH:MM:SS)
#SBATCH --output=outputs/%j.out  # 标准输出文件
#SBATCH --error=errors/%j.err  # 标准错误输出文件
#SBATCH --output=latest.out  # 标准输出文件
#SBATCH --error=latest.err  # 标准错误输出文件
#SBATCH --mail-type=END,FAIL  # 邮件通知类型
#SBATCH --mail-user=3315147049@qq.com  # 接收通知的邮箱


module load intel/oneapi2023.2
mpirun -np 64 ./testOpenCAEPoro ./data/case1/case1.data verbose=1
