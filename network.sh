# This script edits the default network configuration from OpenWrt and enables the use of multihoming in
# the device. To do so, it creates a VLAN that will be used as a WAN interface, and then links it to a switch
# port.

cp /etc/config/network /etc/config/network_backup

# This sets a new VLAN that will act as a second WAN interface
uci set network.lan2='interface'
uci set network.lan2.ifname='eth2'
uci set network.lan2.proto='dhcp'
uci set network.lan2.metric='200'

# We set a diffreent metric for the WAN interface
uci set network.wan.metric='100'

# Here we assign the ports that will act as the LAN interfaces
uci set network.lans='switch_vlan'
uci set network.lans.device='switch0'
uci set network.lans.vlan='1'
uci set network.lans.ports='0 1 2 6t'

# Then we assign the VLAN we created to a fisical port
uci set network.wan2='switch_vlan'
uci set network.wan2.device='switch0'
uci set network.wan2.vlan='2'
uci set network.wan2.ports='3 6t'

uci commit network

# And finally we must reload the network configuration
/etc/init.d/network reload