# Security Overview

This document summarizes the security posture of the **SD-WAN Hybrid Connectivity** architecture.

## Network Security

### Encryption

- **IPsec VPN**: AES-256 encryption for all VPN tunnels
- **Direct Connect**: MACsec encryption available
- **Transit Gateway**: Encrypted inter-region peering
- **TLS**: Application-layer encryption

### Authentication

- **Pre-shared keys**: For VPN tunnel establishment
- **Certificate-based**: For enhanced VPN security
- **BGP MD5**: Route authentication
- **IAM**: AWS resource access control

### Network Isolation

- **Route domains**: Separate routing tables per segment
- **Security groups**: Instance-level controls
- **Network ACLs**: Subnet-level filtering
- **Firewall inspection**: Transit Gateway integration

## SD-WAN Security Features

### Traffic Inspection

- **Deep packet inspection**: Via Network Firewall
- **IDS/IPS**: Threat detection and prevention
- **URL filtering**: Block malicious destinations
- **Application awareness**: Policy by application

### Path Security

- **Dynamic path selection**: Avoid compromised links
- **Link health monitoring**: Detect degradation
- **Automatic failover**: Maintain connectivity
- **Traffic encryption**: All paths encrypted

## Multi-Cloud Security

- **Consistent policies**: Across cloud providers
- **Centralized management**: Single control plane
- **Cross-cloud encryption**: End-to-end protection
- **Unified logging**: Consolidated audit trail

## Compliance

The architecture supports:

- SOC 2 Type II
- PCI-DSS network segmentation
- HIPAA network security
- ISO 27001 controls

> For detailed security configurations, see `SECURITY.md` in the project root.
