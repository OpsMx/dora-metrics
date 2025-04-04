# dora-metrics  
clone this repo  
cd dora-metrics  
kubectl apply -k .  
 

#!/bin/bash

API_URL="https://example.com/api"  # Replace with your API endpoint

# Fetch JSON data
response=$(curl -s "$API_URL")
if [[ -z "$response" ]]; then
    echo "Error: Empty response from API"
    exit 1
fi

# Extract values using jq
state=$(echo "$response" | jq -r '.state')
startTime=$(echo "$response" | jq -r '.startTime')
endTime=$(echo "$response" | jq -r '.endTime')

# Validate extracted values
if [[ -z "$state" || -z "$startTime" || -z "$endTime" ]]; then
    echo "Error: Missing required JSON fields"
    exit 1
fi

# Check conditions
if [[ "$state" == "Implement" ]]; then
    echo "$response"  # Print valid JSON
    exit 0
fi

if [[ "$state" != "Scheduled" ]]; then
    echo "Error: State is not Implement or Scheduled"
    exit 1
fi

# Convert timestamps
endTimestamp=$(date -d "$endTime" +"%s" 2>/dev/null)
if [[ -z "$endTimestamp" ]]; then
    echo "Error: Invalid endTime format"
    exit 1
fi

startTimestamp=$(date -d "$startTime" +"%s" 2>/dev/null)
if [[ -z "$startTimestamp" ]]; then
    echo "Error: Invalid startTime format"
    exit 1
fi

currentTime=$(date +"%s")

# Check if current time is within the time window
if (( currentTime > endTimestamp )) || (( currentTime < startTimestamp )); then
    echo "Error: Current time is not within the allowed time window"
    exit 1
fi

# If all conditions pass, print valid JSON
echo "$response"


    if [[ "$sync_duration" =~ ^[0-9]+$ ]]; then
        echo "Sync Time: ${sync_duration}s" >> $output_file
    else
        echo "Sync Time: $sync_duration" >> $output_file
    fi
    echo "---------------------------" >> $output_file
done

echo "Sync Report generated: $output_file"
