# Troubleshooting

Common issues and resolutions for the **SD-WAN Hybrid Connectivity** architecture.

## VPN Issues

### 1. VPN Tunnel Down

**Symptom:** Tunnel status shows "DOWN".

**Resolution:**
- Verify on-premises router is reachable
- Check IKE/IPsec configuration matches
- Verify pre-shared key is correct
- Check firewall allows UDP 500, 4500
- Review CloudWatch VPN metrics

### 2. BGP Peering Not Established

**Symptom:** BGP state stuck in "Idle" or "Active".

**Resolution:**
- Verify BGP ASN configuration
- Check BGP peer IP addresses
- Verify TCP 179 is allowed
- Check MD5 authentication if configured
- Review BGP timers

### 3. Asymmetric Routing

**Symptom:** Traffic takes different paths in/out.

**Resolution:**
- Review BGP route advertisements
- Check AS path prepending
- Verify route table priorities
- Consider MED/Local Preference settings

## Direct Connect Issues

### 4. Direct Connect Link Down

**Symptom:** Connection shows "down" state.

**Resolution:**
- Contact colocation provider
- Check physical layer (fiber, optics)
- Verify VLAN configuration
- Review BGP peering status

### 5. Direct Connect Performance Issues

**Symptom:** Throughput lower than expected.

**Resolution:**
- Check for packet drops
- Verify MTU settings (jumbo frames)
- Review traffic patterns for congestion
- Check for micro-bursting

## Transit Gateway Issues

### 6. Routes Not Propagating

**Symptom:** VPCs cannot reach each other.

**Resolution:**
- Check Transit Gateway route tables
- Verify attachment associations
- Review route propagation settings
- Check for blackhole routes

### 7. Transit Gateway Attachment Failed

**Symptom:** Attachment stuck in "pending".

**Resolution:**
- Verify subnet availability
- Check IAM permissions
- Review VPC CIDR conflicts
- Check Transit Gateway quotas

## Multi-Cloud Issues

### 8. Cross-Cloud Connectivity Failure

**Symptom:** Cannot reach resources in other cloud.

**Resolution:**
- Verify interconnect is active
- Check BGP routes are exchanged
- Review firewall rules on both sides
- Test with traceroute

## Performance Issues

### 9. High Latency

**Symptom:** Application latency exceeds SLA.

**Resolution:**
- Check path selection (prefer Direct Connect)
- Review traffic routing
- Consider AWS Global Accelerator
- Optimize application placement

### 10. Packet Loss

**Symptom:** Intermittent connectivity issues.

**Resolution:**
- Check link utilization
- Review QoS policies
- Test alternate paths
- Contact ISP if external issue

> For architecture details, see `ARCHITECTURE.md`.
