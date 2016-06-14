m = Map("oor", "Network") -- We want to edit the uci config file /etc/config/lispd

s = m:section(TypedSection, "map-resolver", translate("Map Resolver"))
s.addremove = true
s.anonymous = true
   s:option(Value, "address", "Address", "Encapsulated Map-Requests are sent to this map resolver (IPv4 or IPv6 or FQDN name)")

s = m:section(TypedSection, "map-server", "Map Server")
   s.addremove = true
   s.anonymous = true
   s:option(Value, "address", "Address", "Register to this map server (IPv4 or IPv6 or FQDN name)")
   s:option(Value, "key", "Key","Password to authenticate with the map-server")

s = m:section(TypedSection, "database-mapping", "Database Mapping")
   s.addremove = true
   s.anonymous = true
   s:option(Value, "eid_prefix", "EID prefix", "IPv4 or IPv6 network address of the OpenWrt LISP node / prefix length : x.x.x.x/x | y:y:y:y::y/y")
   ni = s:option(Value, "interface", translate("RLOC Interface"), "Interface containing theRLOCs associated to this EID")
   	ni.template    = "cbi/network_ifacelist"
   	ni.override_values = true
   	ni.widget = "radio"
   	ni.nobridges = false
   s:option(Value, "priority_v4", "IPv4 Priority","Priority of IPv4 locator of the interface for this EID. Locators with lower values are more preferable. A value of -1  means that IPv4 address of that interface is not used [0-255]")
   s:option(Value, "weight_v4", "IPv4 Weight", "Weight of IPv4 locator of the interface for this EID. When priorities are the same for multiple RLOCs, the Weight indicates how to balance unicast traffic between them [0-255]")
   s:option(Value, "priority_v6", "IPv6 Priority","Priority of IPv6 locator of the interface for this EID. Locators with lower values are more preferable. A value of -1  means that IPv6 address of that interface is not used [0-255]")
   s:option(Value, "weight_v6", "IPv6 Weight","Weight of IPv6 locator of the interface for this EID. When priorities are the same for multiple RLOCs, the Weight indicates how to balance unicast traffic between them [0-255]")

s = m:section(TypedSection, "proxy-itr", "Proxy ITR")
   s.addremove = true
   s.anonymous = true
   s:option(Value, "address", "Address", "List of PITRs to SMR on handover (IPv4 or IPv6 or FQDN name) ")

return m -- Returns the map