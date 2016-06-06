# This script edits the default network configuration from OpenWrt and enables the use of multihoming in
# the device. To do so, it creates a VLAN that will be used as a WAN interface, and then links it to a switch
# port.

uci set network.lan2='interface'
uci set network.@lan2[0].ifname='eth0.2'
uci set network.@lan2[0].proto='dhcp'
uci set network.@lan2[0].metric='200'

uci set network.@wan[0].metric='100'

uci set network.lans='switch_vlan'
uci set network.@lans[0].device='switch0'
uci set network.@wan2[0].vlan='1'
uci set network.@wan2[0].ports='0 1 2 5t'

uci set network.wan2='switch_vlan'
uci set network.@wan2[0].device='switch0'
uci set network.@wan2[0].vlan='2'
uci set network.@wan2[0].ports=$2+' 5t'