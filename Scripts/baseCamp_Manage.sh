#!/bin/bash

#content-type
CT="Content-Type:application/json"

#################################
#
# Global VARs
#
#################################

#user and password credentials
USER="admin"
PASSWD="nutanix/4u"

#services
SERVICES_URL="https://10.68.69.102:9440/PrismGateway/services/rest/v2.0"
RESPONSE_CODE="%{http_code}\n"

#resources
RESOURCE_VM="/vms/"
RESOURCE_SC="/storage_containers/"
RESOURCE_IM="/images/"
RESOURCE_CL="/cluster/"

#response code
#curl --insecure -s -H $CT -X GET -u $USER:$PASSWD "$SERVICES_URL$RESOURCE_CL" | jq -r .entities[0].cluster_external_data_services_ipaddress
echo -e "Enter cluster name: \c"
read ClusterName
echo -e "Enter External IP: \c"
read ExternalIP
echo -e "Enter External Data Service IP: \c"
read ExternalDataIP

curl --insecure -X PUT -H $CT -u $USER:$PASSWD -d "{\"name\":\"$ClusterName\",\"cluster_external_ipaddress\":\"$ExternalIP\",\"cluster_external_data_services_ipaddress\":\"$ExternalDataIP\"}" "$SERVICES_URL$RESOURCE_CL"





#end
