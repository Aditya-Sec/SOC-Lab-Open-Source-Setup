OPNsense (firewall) - lab notes

I run OPNsense as a VM (recommended):
- VM settings: 2 vCPUs, 4GB RAM, two NICs (WAN, LAN)
- Default login: root / opnsense (change immediately)
- To block an internal host for containment:
  1. Firewall -> Rules -> LAN -> Add rule: Block traffic from 192.168.56.102 to any
  2. Save and apply
- Export a screenshot of the rule from the UI and add to snapshots/opnsense-rules.txt (or PNG)
