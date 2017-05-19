#!/bin/bash

#content-type
CT=“Content-Type:application/json”

#user and password credentials
USER=“admin”
PASSWD=“nutanix/4u”

#services
SERVICE_URL=https://10.68.69.102:9440/PrismGateway/services/rest/v2.0/storage_containers/

#responde code 
curl --insecure -X PUT -H $CT -u $USER:$PASSWD -d ‘{
   “advertised_capacity”: 512000000,
  “compression_delay_in_secs”: 6000,
  “compression_enabled”: true,
  “id”: “00054f27-8d95-c871-357c-001fc69c7978::26295",
  “name”: “Test”,
  “vstore_name_list”: [
    “Test”
  ]
}’ $SERVICE_URL