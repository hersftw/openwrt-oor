# This script edits the default configuration file for Open Overlay Router (OOR)
#  to fit the options selected by config.sh

# TODO: Copy the example file to /etc/config/oor

# General configuration
uci set oor.@daemon[0].operating_mode=xTR

# Tunnel Router general configuration
uci set oor.@map-resolver[0].address=$4

# xTR configuration
uci set oor.@map-server[0].address=$5
uci set oor.@map-server[0].key=$3
uci set oor.@database-mapping[0].eid_prefix=$6
uci set oor.@database-mapping[0].rloc_set=external_ifs

#Miscellaneous configuration
oor set oor.@rloc-set[0].name=external_ifs
oor set oor.@rloc-set[0].rloc_name=rloc_1
oor add_list oor.@rloc-set[0].rloc_name=rloc_2

