# Runbook

Operational guide for deploying and managing the **SD-WAN Hybrid Connectivity** architecture.

## 1. Deployment

### Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform 1.5+ installed
- Direct Connect LOA (if using dedicated connection)
- On-premises router configurations

### Deploy Steps

```bash
# Initialize Terraform
terraform init

# Plan deployment
terraform plan -var="environment=prod" -out=tfplan

# Apply deployment
terraform apply tfplan
```

## 2. Site Onboarding

### Add New Branch Site

1. Create Customer Gateway in AWS
2. Create VPN connection to Transit Gateway
3. Configure on-premises router
4. Verify BGP peering
5. Test connectivity

### VPN Configuration Example

```hcl
resource "aws_customer_gateway" "branch" {
  bgp_asn    = 65000
  ip_address = "203.0.113.1"
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "branch" {
  customer_gateway_id = aws_customer_gateway.branch.id
  transit_gateway_id  = aws_ec2_transit_gateway.main.id
  type                = "ipsec.1"
}
```

## 3. Routing Management

### Update Route Tables

```bash
# Add route to Transit Gateway route table
aws ec2 create-transit-gateway-route \
  --transit-gateway-route-table-id tgw-rtb-xxx \
  --destination-cidr-block 10.100.0.0/16 \
  --transit-gateway-attachment-id tgw-attach-xxx
```

### BGP Configuration

- Advertise on-premises routes via BGP
- Set appropriate AS path prepending
- Configure route preferences

## 4. Monitoring

### Key Metrics to Watch

- **Tunnel status**: Up/down state
- **BGP peer status**: Established/idle
- **Bandwidth utilization**: Per connection
- **Latency**: End-to-end path latency
- **Packet loss**: Link quality indicator

### Dashboards

Pre-configured dashboards for:

- Network topology view
- Connection health
- Traffic analytics
- Cost tracking

## 5. Failover Testing

### Test VPN Failover

1. Identify primary and backup tunnels
2. Simulate primary tunnel failure
3. Verify traffic shifts to backup
4. Measure failover time
5. Restore primary tunnel

## 6. Maintenance

### Regular Tasks

- Review BGP route tables monthly
- Test failover quarterly
- Update VPN configurations as needed
- Audit security policies

### Teardown

```bash
terraform destroy -var="environment=dev"
```

> For troubleshooting common issues, see `docs/troubleshooting.md`.
