# SOC Lab — Built by Aditya Kumar Goswami

> Compact, reproducible SOC lab using open-source tooling: Filebeat, Elasticsearch, Kibana, Wazuh, Suricata, TheHive, Cortex, MISP, Grafana, OPNsense.

## Overview
I built this lab to demonstrate collection, detection, enrichment, alerting and triage workflows in a compact SOC environment. This repo contains all configs, docker compose, scripts and snapshots to reproduce my setup.

**Components**
- Filebeat (log shipper)
- Elasticsearch (single-node for the lab)
- Kibana (visualization)
- Wazuh (host detection and manager)
- Suricata (network IDS)
- TheHive (case management)
- Cortex (analyzers)
- MISP (threat intel)
- Grafana (dashboarding)
- OPNsense (firewall - VM notes)

## Repo layout

soc-project/
├─ README.md
├─ LICENSE
├─ docker-compose.yml
├─ infra/
│ ├─ filebeat/filebeat.yml
│ ├─ suricata/suricata.yaml.example
│ ├─ wazuh/agent.conf
│ ├─ thehive/config.example
│ └─ cortex/config.example
├─ scripts/
│ ├─ install-kali-suricata.sh
│ ├─ install-opnsense-notes.md
│ └─ export-kibana-saved-objects.sh
├─ docs/
│ ├─ architecture.txt
│ ├─ playbooks.md
│ └─ troubleshooting.md
├─ snapshots/
│ ├─ snapshot-01-elasticsearch-health.txt
│ ├─ snapshot-02-kibana-indices.txt
│ ├─ snapshot-03-wazuh-agents.txt
│ └─ snapshot-04-suricata-eve-sample.json
└─ .gitignore


## Quick start (step-by-step)
> I used **Ubuntu 22.04** for core services (docker host) and **Kali Purple 2024.1** for Suricata. VMware Workstation Pro for VMs.

### A. Prepare central server

1. Install Docker & docker-compose on Ubuntu:
bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable --now docker

2. Paste docker-compose.yml (this repo) into server and start:
bash
sudo docker-compose up -d
sudo docker ps

### B. Deploy Suricata + Filebeat on Kali Purple

Copy scripts/install-kali-suricata.sh to Kali and run:
sudo bash install-kali-suricata.sh
Edit /etc/filebeat/filebeat.yml to point to your Elasticsearch (output.elasticsearch.hosts).

### C. Register Wazuh agents (optional local endpoints)

On agent: install wazuh-agent and set infra/wazuh/agent.conf values.
Register the agent with manager (commands in docs/troubleshooting.md).

### D. Access UIs

Elasticsearch: http://<server-ip>:9200 (user: elastic, password: changeme)
Kibana: http://<server-ip>:5601
Grafana: http://<server-ip>:3000 (admin / changeme)
TheHive: http://<server-ip>:9000
MISP: http://<server-ip>:8085

### Verification & snapshots

I included CLI outputs in /snapshots that show cluster health, indices, registered agents and a sample Suricata event.

## Notes

Replace default passwords in production.
Keep API keys out of repository; use env vars or vault.

This is a lab deployment: tune resource limits for production.

# Contact
Aditya Kumar Goswami — project author
