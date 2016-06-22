module("luci.controller.oor.oor", package.seeall)

function index()
	entry({"admin", "network", "interfaces"}, cbi("oor/oor"), "OOR Configuration", 30).dependent=false
end