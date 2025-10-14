#!/bin/bash

# Recursively create or update Kubernetes secrets from files in a directory
# Each folder name becomes the secret name with '-secrets' suffix

# Exit on any error
set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find all .env.secret files recursively
find "$ROOT_DIR" -name ".env" | while read -r FILE; do
  DIR=$(dirname "$FILE")
  SERVICE_NAME=$(basename "$DIR")
  SECRET_NAME="${SERVICE_NAME}-secrets"

  echo "Applying secret: $SECRET_NAME from directory: $FILE"

  # Create or update using --dry-run + apply
  kubectl create secret generic "$SECRET_NAME" \
    --from-env-file="$FILE" \
    --dry-run=client -o yaml | kubectl apply -f -
done

echo "All secrets applied successfully."