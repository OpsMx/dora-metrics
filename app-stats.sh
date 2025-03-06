output_file="sync_duration_report.txt"

for app in $(kubectl get app -o name); do
    echo "App: $app" >> $output_file
    sync_duration=$(kubectl get $app -o json | jq -r 'if .status.operationState.startedAt and .status.operationState.finishedAt then (.status.operationState.finishedAt | fromdateiso8601) - (.status.operationState.startedAt | fromdateiso8601) else "Not Available" end')

    if [[ "$sync_duration" =~ ^[0-9]+$ ]]; then
        echo "Sync Time: ${sync_duration}s" >> $output_file
    else
        echo "Sync Time: $sync_duration" >> $output_file
    fi
    echo "---------------------------" >> $output_file
done

echo "Sync Report generated: $output_file"
---

output_file="sync_duration_report.txt"
temp_file="temp_sync_report.txt"

# Collect app sync times in temporary file
> $temp_file

for app in $(kubectl get app -o name); do
    sync_duration=$(kubectl get $app -o json | jq -r 'if .status.operationState.startedAt and .status.operationState.finishedAt then (.status.operationState.finishedAt | fromdateiso8601) - (.status.operationState.startedAt | fromdateiso8601) else "Not Available" end')

    if [[ "$sync_duration" =~ ^[0-9]+$ ]]; then
        echo "$sync_duration App: $app | Sync Time: ${sync_duration}s" >> $temp_file
    else
        echo "0 App: $app | Sync Time: Not Available" >> $temp_file
    fi
done

# Sort apps by sync time in decreasing order
sort -nr $temp_file | awk -F' ' '{ $1=""; print substr($0,2) }' > $output_file

# Clean up temp file
rm -f $temp_file

echo "Sync Report generated: $output_file"
---


output_file="sync_duration_report.txt"
temp_file="temp_sync_report.txt"

# Collect app sync times in temporary file
> $temp_file

for app in $(kubectl get app -o name); do
    start_time=$(kubectl get $app -o json | jq -r '.status.operationState.startedAt')
    end_time=$(kubectl get $app -o json | jq -r '.status.operationState.finishedAt')

    sync_duration=$(kubectl get $app -o json | jq -r 'if .status.operationState.startedAt and .status.operationState.finishedAt then (.status.operationState.finishedAt | fromdateiso8601) - (.status.operationState.startedAt | fromdateiso8601) else "Not Available" end')

    if [[ "$sync_duration" =~ ^[0-9]+$ ]]; then
        echo "$sync_duration App: $app | Sync Time: ${sync_duration}s | Start Time: $start_time | End Time: $end_time" >> $temp_file
    else
        echo "0 App: $app | Sync Time: Not Available | Start Time: $start_time | End Time: $end_time" >> $temp_file
    fi
done

# Sort apps by sync time in decreasing order
sort -nr $temp_file | awk -F' ' '{ $1=""; print substr($0,2) }' > $output_file

# Clean up temp file
rm -f $temp_file

echo "Sync Report generated: $output_file"

