# This script edits the default network configuration from OpenWrt and enables the use of multihoming in
# the device. To do so, it creates a VLAN that will be used as a WAN interface, and then links it to a switch
# port.

cp /etc/config/network /etc/config/network_backup

# Create a VLAN that will act as a second WAN interface
uci set network.lan2='interface'
uci set network.lan2.ifname='eth1.3'
uci set network.lan2.proto='dhcp'
uci set network.lan2.metric='200'

# Assign a VLAN to the LAN switch
uci set network.lan.ifname='eth1.1'

# Set a different metric for the WAN interface
uci set network.wan.metric='100'

# Enable VLANs in the internal switch
uci add network switch
uci set network.@switch[-1].name='switch0'
uci set network.@switch[-1].reset='1'
uci set network.@switch[-1].enable_vlan='1'

# Assign the ports that will act as LAN interfaces
uci set network.lans='switch_vlan'
uci set network.lans.device='switch0'
uci set network.lans.vlan='1'
uci set network.lans.ports='0 1 2 6t'

# Assign the WAN2 VLAN to a physical port
uci set network.wan2='switch_vlan'
uci set network.wan2.device='switch0'
uci set network.wan2.vlan='2'
uci set network.wan2.ports='3 6t'

# Save changes and reload the service
uci commit network
/etc/init.d/network reload
