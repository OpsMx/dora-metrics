#!/bin/bash

# Variables
url="http://example.com"  # Replace with your actual URL
token="your_token_here"  # Replace with your token
gitBranch="branch_name"  # Replace with your branch
sealId="seal_id_value"  # Replace with your sealId
jetId="jet_id_value"  # Replace with your jetId
artifactCreateDate="2025"  # Replace with your artifact create date

# Create the query string
queryString="branch=${gitBranch}&sealId=${sealId}&jetId=${jetId}&artifactCreateDate=${artifactCreateDate}"

# Make the HTTP GET request using curl
response=$(curl -s -w "%{http_code}" -o response_body.txt -X GET \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${token}" \
    "${url}?${queryString}")

# Check the HTTP status code
http_code=$(echo "$response" | tail -n1)

# Read the response body
response_body=$(cat response_body.txt)

# Error handling based on status code
if [[ "$http_code" -ne 200 ]]; then
    echo "ERROR: Request failed with status code $http_code"
    echo "Response: $response_body"
    exit 1
fi

# Parse the JSON response (using jq for simplicity)
releaseReady=$(echo "$response_body" | jq -r '.ReleaseReady')

# Check if ReleaseReady is true or false
if [[ "$releaseReady" == "true" ]]; then
    echo "SUCCESS: Release check validation passed"
else
    echo "FAILURE: Release check validation failed"
    exit 1
fi
