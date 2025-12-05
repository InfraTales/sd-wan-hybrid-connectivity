#!/bin/bash
# Pulumi Deployment Script

set -e

STACK=${1:-dev}

echo "Deploying Pulumi stack: $STACK..."

# Install dependencies
npm install

# Select stack
pulumi stack select $STACK || pulumi stack init $STACK

# Preview
pulumi preview

# Deploy
pulumi up --yes

echo "✓ Deployment complete!"
