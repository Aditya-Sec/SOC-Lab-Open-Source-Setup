Common troubleshooting steps I used

1. Elasticsearch OOM / bind failure:
   - Edit /etc/elasticsearch/elasticsearch.yml: set network.host: 0.0.0.0 (lab only)
   - Set vm.max_map_count: sudo sysctl -w vm.max_map_count=262144

2. Filebeat not sending:
   - sudo filebeat test config
   - sudo filebeat test output
   - tail logs: journalctl -u filebeat -n 200

3. Suricata not writing eve.json:
   - Check /etc/suricata/suricata.yaml for eve-log enabled
   - sudo systemctl status suricata
   - Check permissions: /var/log/suricata/

4. Wazuh agent not registered:
   - On manager: /var/ossec/bin/manage_agents (add/register)
   - Check connectivity to port 1515
