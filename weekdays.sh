week_days=(Sun Mon Tue Wed Thr Fri Sat)
days_count=(0 0 0 0 0 0 0)
max=0
for i in {0..6}
do
	days_count[$i]=$(egrep " ${week_days[$i]} " "log file.txt" | wc -l)
	[[ ${days_count[$i]} -gt $max ]] && max=${days_count[$i]}
done
max_days=""
for i in {0..6}
do
	[[ ${days_count[$i]} -eq $max ]] && max_days="$max_days ${week_days[$i]}"
done
[[ $max -gt 0 ]] && echo $max_days || echo "no commits"
