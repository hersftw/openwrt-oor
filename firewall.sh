# This script configures the firewall of OpenWrt to enable the use of OOR 
# and LISP. We must allow traffic in ports 4341 and 4342, as well as forwarding in 4341.

# First we will create a backup for the firewall file
cp /etc/config/firewall /etc/config/firewall_backup

# Then we will configure the required ports and interfaces on the firewall configuration file
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

uci commit firewall

# Finally the firewall service must be restarted
/etc/init.d/firewall restart