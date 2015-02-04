os.loadAPI("Touchpoint")

---- global

extra = {
	eventUpdateDelay = 0.5  --- update every tick
}

pkgreciever = {
	listeningPort = 1100
}

pkgsender = {
	m = peripheral.wrap("back")
	send = function (self, port, pkg)
		self.m.transmit(port, pkgreciever.listeningPort, pkg)
	end
}

rserver = {
	getEnergyStored = function (self, port)
                    local newpkg = {
                        request = "getEnergyStored"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	isActive = function (self, port)
                    local newpkg = {
                        request = "getActive"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getFuelTemperature = function (self, port)
                    local newpkg = {
                        request = "getFuelTemperature"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getCasingTemperature = function (self, port)
                    local newpkg = {
                        request = "getCasingTemperature"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getFuelAmount = function (self, port)
                    local newpkg = {
                        request = "getFuelAmount"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getFuelAmountMax = function (self, port)
                    local newpkg = {
                        request = "getFuelAmountMax"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getEnergyProducedLastTick = function (self, port)
                    local newpkg = {
                        request = "getEnergyProducedLastTick"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getFuelReactivity = function (self, port)
                    local newpkg = {
                        request = "getFuelReactivity"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	getFuelConsumedLastTick = function (self, port)
                    local newpkg = {
                        request = "getFuelConsumedLastTick"
                    }
                    pkgsender:send(port, newpkg)
	            end,
	setActive = function (self, port, active)
	                local newpkg = {
                        request = "setActive",
                        value = active
                    }
                    pkgsender:send(port, newpkg)
	            end
}

---- views
currentReactor = {
	updateView = function (self, info)

	             end

}

---- model
model = {
	views = {},
	reactors = {},
	addReactors = function (self, name, port)
	                  self.reactors[name] = port
	              end
	addView = function (self, name, v)
	              views[name] = v;
	          end,
	notifyAllViews = function (self, info)
	                     for v in self.views do
	                     	v.updateView(info)
	                     end
	                 end
}


---- main 
t = touchpoint.new("top")
reactors["r1"] = 1101;   ---- added reactor server 1 with port 1101


---- event loop
while (true) do
	local event, args1, args2, args3 = os.pullEvent()
	if event == "monitor_touch" then 
		---- button click
	else
	sleep(extra.eventUpdateDelay)
end