# Cost Analysis (₹)

This document provides cost estimates for the **SD-WAN Hybrid Connectivity** architecture in **Indian Rupees (₹)**.

## Production Environment

At production scale (multi-site enterprise), the architecture typically costs:

| Service | Monthly Cost (₹) | Notes |
|---------|------------------|-------|
| **Transit Gateway** | ₹40,000–70,000 | Per attachment + data processing |
| **Direct Connect** | ₹80,000–150,000 | Dedicated connection |
| **Site-to-Site VPN** | ₹15,000–30,000 | Backup/secondary connections |
| **Cloud WAN** | ₹50,000–100,000 | Global network management |
| **Route 53 Resolver** | ₹5,000–10,000 | Hybrid DNS |
| **CloudWatch** | ₹5,000–10,000 | Network monitoring |
| **Total** | **₹200,000–370,000** | ~$2,500–4,625/month |

## Per-Site Costs

| Site Type | Monthly Cost (₹) | Notes |
|-----------|------------------|-------|
| Headquarters | ₹80,000–120,000 | Direct Connect + redundancy |
| Branch office | ₹15,000–30,000 | VPN connections |
| Remote site | ₹8,000–15,000 | Single VPN tunnel |

## Cost Optimization Strategies

- **Right-size Direct Connect** – Match port speed to actual usage
- **Use VPN for low-traffic sites** – Cheaper than Direct Connect
- **Transit Gateway sharing** – Share across accounts via RAM
- **Data transfer optimization** – Route traffic efficiently
- **Reserved capacity** – Commit for Direct Connect discounts

## Multi-Cloud Costs

| Cloud | Interconnect Cost (₹/month) |
|-------|----------------------------|
| AWS ↔ Azure | ₹30,000–50,000 |
| AWS ↔ GCP | ₹25,000–45,000 |
| AWS ↔ On-Prem | ₹80,000–150,000 |

## Related Documentation

See `ARCHITECTURE.md` for service details and `DEPLOYMENT.md` for configuration options.
