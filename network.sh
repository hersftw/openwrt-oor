# This script edits the default network configuration from OpenWrt and enables the use of multihoming in
# the device. To do so, it creates a VLAN that will be used as a WAN interface, and then links it to a switch
# port.

# This sets a new VLAN that will act as a second WAN interface
uci set network.lan2='interface'
uci set network.@lan2[0].ifname='eth0.2'
uci set network.@lan2[0].proto='dhcp'
uci set network.@lan2[0].metric='200'

# We set a diffreent metric for the WAN interface
uci set network.@wan[0].metric='100'

# Here we assign the ports that will act as the LAN interfaces
uci add network lans='switch_vlan'
uci set network.@lans[0].device='switch0'
uci set network.@wan2[0].vlan='1'
uci set network.@wan2[0].ports='0 1 2 5t'

# Then we assign the VLAN we created to a fisical port
uci add oor wan2='switch_vlan'
uci set network.wan2='switch_vlan'
uci set network.@wan2[0].device='switch0'
uci set network.@wan2[0].vlan='2'
uci set network.@wan2[0].ports='3 5t'

# And finally we must reload the network configuration
/etc/init.d/network reload