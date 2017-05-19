#!/bin/bash

#content-type
CT="Content-Type:application/json"

#user and password credentials
USER="admin"
PASSWD="nutanix/4u1"

#services
SERVICE_URL=https://10.68.69.102:9440/PrismGateway/services/rest/v2.0/networks/
RESPONSE_CODE="%{http_code}\n"

#resource
RESOURCE_VM="/vms/"
RESOURCE_NETWORKS="/networks/"
DOMAIN_NAME="techsummit.local"
DOMAIN_NAME_SERVERS="8.8.8.8"
DEFAULT_GATEWAY="10.64.69.1"
DHCP_SERVER_ADDRESS="10.64.69.254"
NETWORK_ADDRESS="10.64.69.0"
POOL_RANGE="10.64.69.5 10.64.69.10"
PREFIX_LENGTH="24"
LOGICAL_TIMESTAMP="0"
NETWORK_NAME="VM Network6"
VLAN_ID="6"

echo -e "Type VLAN ID for new network: \c"
read VLAN_ID 


#response code
curl --insecure -H $CT -X POST -u $USER:$PASSWD -d "{
   \"annotation\":\"\",
   \"ip_config\":{
      \"default_gateway\":\"$DEFAULT_GATEWAY\",
      \"dhcp_options\":{
         \"domain_name\":\"$DOMAIN_NAME\",
         \"domain_name_servers\":\"$DOMAIN_NAME_SERVERS\",
         \"domain_search\":\"$DOMAIN_SEARCH\",
         \"tftp_server_name\":\"\"
      },
      \"dhcp_server_address\":\"$DHCP_SERVER_ADDRESS\",
      \"network_address\":\"$NETWORK_ADDRESS\",
      \"pool\":[
         {
            \"range\":\"$POOL_RANGE\"
         }
      ],
      \"prefix_length\":$PREFIX_LENGTH
   },
   \"logical_timestamp\":$LOGICAL_TIMESTAMP,
   \"name\":\"$NETWORK_NAME\",
   \"vlan_id\":$VLAN_ID,
   \"vswitch_name\":\"\"
}" "https://10.68.69.102:9440/PrismGateway/services/rest/v2.0/networks/"