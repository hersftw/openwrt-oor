# This script edits the default configuration file for Open Overlay Router (OOR)
#  to fit the options selected by config.sh

# General configuration
uci set oor.daemon.operating_mode=xTR

# MS/MR configuration
uci set oor.ms_basic.control_iface=$1 #ms_if
uci set oor.lisp-site.eid_prefix=$2 #eid_addr
uci set oor.lisp-site.key=$3 # ms_pass

# Tunnel Router general configuration
uci set oor.map-resolver.address=$4

# xTR configuration
uci set oor.map-server.address=$5
uci set oor.map-server.key=$3
uci set oor.database-mapping.eid_prefix=$6