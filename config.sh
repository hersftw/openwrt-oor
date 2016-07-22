# This file executes the configuration scripts to create a simple multihoming environment

# Enable and configure multihoming on the device
sh ./network.sh

# Configure OOR to work with a default configuration
sh ./oor.sh

# Configure the firewall to allow traffic on both interfaces
sh ./firewall.sh
