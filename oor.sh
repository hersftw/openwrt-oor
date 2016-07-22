# This script edits the default configuration file for Open Overlay Router (OOR)
#  to create a default multihoming environment

# TODO: Copy the example file to /etc/config/oor

# Set the operating mode to xTR
uci set oor.@daemon[0].operating_mode='xTR'

# Assign the EID prefix to an RLOC set
uci set oor.@database-mapping[0].rloc_set='external_ifs'

# Create the two needed RLOC interfaces
uci set oor.@rloc-set[0].name='external_ifs'
uci set oor.@rloc-set[0].rloc_name='rloc_1'
uci add_list oor.@rloc-set[0].rloc_name='rloc_2'

# Assign the first RLOC interface to WAN port
uci set oor.wan1='rloc_iface'
uci set oor.@rloc-iface[-1].name='rloc_1'
uci set oor.@rloc-iface[-1].interface='eth0'
uci set oor.@rloc-iface[-1].ip_version='4'
uci set oor.@rloc-iface[-1].priority='1'
uci set oor.@rloc-iface[-1].weight='50'

# Assign the second RLOC interface to WAN2 port
uci set oor.wan2='rloc_iface'
uci set oor.@rloc-iface[-1].name='rloc_2'
uci set oor.@rloc-iface[-1].interface='eth1.3'
uci set oor.@rloc-iface[-1].ip_version='4'
uci set oor.@rloc-iface[-1].priority='1'
uci set oor.@rloc-iface[-1].weight='50'

# Add default values for Proxy-ETR
uci set oor.@proxy-etr[0].priority='1'
uci set oor.@proxy-etr[0].weight='1'

# Save the changes and reload the service
uci commit oor
/etc/init.d/oor reload
