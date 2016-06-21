# This script edits the default configuration file for Open Overlay Router (OOR)
#  to create a default multihoming environment

# Backup the initial config file
cp /etc/config/oor /etc/config/oor_backup

# Delete all the configurations that are not needed
uci delete oor.@ms_basic[0]
uci delete oor.@lisp-site[0]
uci delete oor.@ms-static-registered-site[0]
uci delete oor.@static-map-cache[0]
uci delete oor.@proxy-itr[0]
uci delete oor.@proxy-etr[0]
uci delete oor.@rtr-iface[0]
uci delete oor.@rloc-address[0]
uci delete oor.@elp-node[0]

# xTR configuration
uci set oor.@database-mapping[0].rloc_set='external_ifs'

#Miscellaneous configuration
uci set oor.@rloc-set[0].name='external_ifs'
uci set oor.@rloc-set[0].rloc_name='rloc_1'
uci add_list oor.@rloc-set[0].rloc_name='rloc_2'

# RLOC interfaces
uci set oor.@rloc-iface[0].name='rloc_1'
uci set oor.@rloc-iface[0].interface='eth0'
uci set oor.@rloc-iface[0].ip_version='4'
uci set oor.@rloc-iface[0].priority='1'
uci set oor.@rloc-iface[0].weight='100'

uci add oor rloc-iface
uci set oor.@rloc-iface[-1].name='rloc_2'
uci set oor.@rloc-iface[-1].interface='eth2'
uci set oor.@rloc-iface[-1].ip_version='4'
uci set oor.@rloc-iface[-1].priority='1'
uci set oor.@rloc-iface[-1].weight='100'

uci commit oor
