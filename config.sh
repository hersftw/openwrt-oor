# This file executes the configuration scripts to create a simple multihoming environment

# network.sh enables and configures multihoming on the device
sh ./network.sh

# oor.sh configures OOR to work with a default configuration
sh ./oor.sh

# firewall.sh configures the firewall to allow multihoming and OOR to work
sh ./firewall.sh