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
