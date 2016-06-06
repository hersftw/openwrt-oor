# This script gets all the required information to configure the system and afterwards executes the scripts that will confiugure it.
echo "Enter the port number for the first WAN: "
read port1
echo "Enter the port number for the second WAN: "
read port2
echo "Enter the interface where MS messages are recieved and generated: "
read ms_if
echo "Enter the address of the Map Server: "
read ms_addr
echo "Enter the password of the Map Server: "
read ms_pass
echo "Enter the address of the Map Resolver: "
read mr_addr
echo "Enter the address of your EID space: "
read eid_addr
echo "Enter the interface where your EIDs are connected: "
read eid_if
echo "Enter the PeTR (?)"
read petr

#sh prova_oor.sh $port1

# network.sh enables and configures multihoming on the device
#sh ./network.sh $port1 $port2
# TODO: Reload network (/etc/init.d/network)

# oor.sh configures OOR to work with the given configuration
sh ./oor.sh $ms_if $eid_addr $ms_pass $mr_addr $ms_addr $eid_if $port1 $port2

# firewall.sh configures the firewall to allow multihoming and OOR to work
#sh ./firewall.sh



