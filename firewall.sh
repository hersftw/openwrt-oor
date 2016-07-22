# This script configures the firewall of OpenWrt to enable the use of OOR 
# and LISP. We must allow traffic in ports 4341 and 4342, as well as forwarding in 4341.

# Create a backup file
cp /etc/config/firewall /etc/config/firewall_backup

uci set firewall.defaults.forward='ACCEPT'

# Create a zone for the new WAN interface
uci add firewall zone
uci set firewall.@zone[-1].name='lan2'
uci set firewall.@zone[-1].network='lan2'
uci set firewall.@zone[-1].input='ACCEPT'
uci set firewall.@zone[-1].output='ACCEPT'
uci set firewall.@zone[-1].forward='ACCEPT'

# Add forwarding between each zone
uci add firewall forwarding
uci set firewall.@forwarding[-1].src='wan'
uci set firewall.@forwarding[-1].dest='lan'

uci add firewall forwarding
uci set firewall.@forwarding[-1].src='lan'
uci set firewall.@forwarding[-1].dest='wan'

uci add firewall forwarding
uci set firewall.@forwarding[-1].src='wan'
uci set firewall.@forwarding[-1].dest='lan2'

uci add firewall forwarding
uci set firewall.@forwarding[-1].src='lan2'
uci set firewall.@forwarding[-1].dest='wan'

uci add firewall forwarding
uci set firewall.@forwarding[-1].src='lan'
uci set firewall.@forwarding[-1].dest='lan2'

uci add firewall forwarding
uci set firewall.@forwarding[-1].src='lan2'
uci set firewall.@forwarding[-1].dest='lan'

# Allow all interaction on ports 4341:4342
uci add firewall rule
uci set firewall.@rule[-1].name='Allow-4341-Input'
uci set firewall.@rule[-1].proto='udp'
uci set firewall.@rule[-1].src_port='4341:4342'
uci set firewall.@rule[-1].target='ACCEPT'

uci add firewall rule
uci set firewall.@rule[-1].name='Allow-4341-Output'
uci set firewall.@rule[-1].proto='udp'
uci set firewall.@rule[-1].dest_port='4341:4342'
uci set firewall.@rule[-1].target='ACCEPT'

uci add firewall rule
uci set firewall.@rule[-1].name='Allow-4341-Forwarding'
uci set firewall.@rule[-1].proto='udp'
uci set firewall.@rule[-1].src_port='4341'
uci set firewall.@rule[-1].target='ACCEPT'

# Save changes and restart the service
uci commit firewall
/etc/init.d/firewall restart
