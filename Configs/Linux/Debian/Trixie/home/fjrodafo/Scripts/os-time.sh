os_date="2026-01-28"
today=$(date +%s)
seconds=$(date -d "$os_date" +%s)
days=$(( (today - seconds) / 86400 ))

echo "$days days"
