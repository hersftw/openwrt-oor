# This script edits the default configuration file for Open Overlay Router (OOR)
#  to create a default multihoming environment

# TODO: Copy the example file to /etc/config/oor

# General configuration
uci set oor.@daemon[0].operating_mode='xTR'

# xTR configuration
uci set oor.@database-mapping[0].rloc_set='external_ifs'

#Miscellaneous configuration
uci set oor.@rloc-set[0].name='external_ifs'
uci set oor.@rloc-set[0].rloc_name='rloc_1'
uci add_list oor.@rloc-set[0].rloc_name='rloc_2'

# RLOC addresses
uci add oor rloc-iface
uci set oor.@rloc-iface[-1].name='rloc_1'
uci set oor.@rloc-iface[-1].interface='eth1'
uci set oor.@rloc-iface[-1].ip_version='4'
uci set oor.@rloc-iface[-1].priority='1'
uci set oor.@rloc-iface[-1].weight='100'

uci add oor rloc-iface
uci set oor.@rloc-iface[-1].name='rloc_2'
uci set oor.@rloc-iface[-1].interface='eth0.2'
uci set oor.@rloc-iface[-1].ip_version='4'
uci set oor.@rloc-iface[-1].priority='1'
uci set oor.@rloc-iface[-1].weight='200'

uci commit oor

/etc/init.d/oor reload
