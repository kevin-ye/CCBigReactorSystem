os.loadAPI("gui")

---- global

pkgreciever = {
	listeningPort = 1100
}

pkgsender = {
	m = peripheral.wrap("back")
	send = function (self, port, pkg)
		self.m.transmit(port, pkgreciever.listeningPort, pkg)
	end
}

reactors = {rserver1}

rserver1 = {
    listeningPort = 1101,
    id = "Main Reactor",
	maxEnergy = function (self)
                    local newpkg = {
                        request = "getmaxEnergy"
                    }
                    pkgsender:send(self.listeningPort, newpkg)
	            end,
}

---- main 



---- event loop
