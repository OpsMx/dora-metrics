#!/bin/bash

REPO="nginx"
IMAGE="nginx"
TAG="test"
JFROG_URL="https://artifactory-jfrog.opencd.opsmx.org"
AUTH="Authorization: Bearer test"

# Get manifest
MANIFEST=$(curl -s -H "$AUTH" "$JFROG_URL/artifactory/$REPO/$IMAGE/$TAG/manifest.json")

# Get config digest
CONFIG_DIGEST=$(echo "$MANIFEST" | jq -r '.config.digest')

LABELS=$(curl -s -H "$AUTH" -H "Accept: application/vnd.oci.image.config.v1+json" "$JFROG_URL/artifactory/api/docker/$REPO/v2/$IMAGE/blobs/$CONFIG_DIGEST"  | jq '.config.Labels')




echo "Image '$IMAGE:$TAG' has labels $LABELS"

 CREATE_DATE=$(curl -s -H "$AUTH" "$JFROG_URL/artifactory/api/storage/$IMAGE/nginx/$TAG" | jq '.created') 
echo "Image '$IMAGE:$TAG' was created at: $CREATE_DATE"
