module("luci.controller.oor.oor", package.seeall)

function index()
	entry({"admin", "network", "interfaces"}, cbi("lisp/lisp"), "LISP Configuration", 30).dependent=false
end