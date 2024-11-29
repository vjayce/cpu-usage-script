#!/bin/bash


Log_file="/home/ubuntu/scripts_vjay/cpu_usage_logs.log"
> "$Log_file"
get_cpu_usage(){
	top -b -n 1 | grep -e "Cpu(s)" | awk '{print 100 - $8}' >> "$Log_file"

}

for i in {1..5};do
	get_cpu_usage
        sleep 2 
done

Average_cpu=$(awk '{sum+=$1} END {print sum/NR}' "$Log_file")

echo "AVerage CPU is: $Average_cpu"
