#!/bin/bash
# Pulumi Preview Script

set -e

STACK=${1:-dev}

npm install
pulumi stack select $STACK
pulumi preview
