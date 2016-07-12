m = Map("oor", "OOR Configuration") -- We want to edit the uci config file /etc/config/lispd

s = m:section(TypedSection, "map-resolver", translate("Map Resolver"))
s.addremove = false
s.anonymous = true
   s:option(Value, "address", "Address", "Encapsulated Map-Requests are sent to this map resolver (IPv4 or IPv6 or FQDN name)")

s = m:section(TypedSection, "map-server", "Map Server")
   s.addremove = false
   s.anonymous = true
   s:option(Value, "address", "Address", "Register to this map server (IPv4 or IPv6 or FQDN name)")
   s:option(Value, "key", "Key","Password to authenticate with the map-server")

s = m:section(TypedSection, "database-mapping", "Database Mapping")
   s.addremove = false
   s.anonymous = true
   s:option(Value, "eid_prefix", "EID prefix", "IPv4 or IPv6 network address of the OpenWrt LISP node / prefix length : x.x.x.x/x | y:y:y:y::y/y")

s = m:section(TypedSection, "rloc-iface", "Multihoming Interfaces")
   s.addremove = false
   s.anonymous = false
   it = s:option(Value, "priority", "Interface type","Priority of IPv4 locator of the interface for this EID. Locators with lower values are more preferable. A value of -1  means that IPv4 address of that interface is not used [0-255]")
	it:value("1", "Active")
	it:value("2", "Backup")
   s:option(Value, "weight", "Load Balancing", "Weight of IPv4 locator of the interface for this EID. When priorities are the same for multiple RLOCs, the Weight indicates how to balance unicast traffic between them [0-255]")

return m -- Returns the map
