#!/bin/bash
# Export saved objects as NDJSON for portability
KIBANA="http://192.168.206.133:5601"
curl -u elastic:changeme -X POST "$KIBANA/api/saved_objects/_export" -H "kbn-xsrf: true" -H "Content-Type: application/json" -d '{"objects":[],"includeReferencesDeep":true}' --output kibana_saved_objects.ndjson
echo "Exported saved objects to kibana_saved_objects.ndjson"
