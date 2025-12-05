#!/bin/bash
# Pulumi Destroy Script

set -e

STACK=${1:-dev}

echo "⚠️  WARNING: This will destroy the Pulumi stack!"
read -p "Are you sure? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
  echo "Cancelled."
  exit 0
fi

pulumi stack select $STACK
pulumi destroy --yes

echo "✓ Destruction complete!"
