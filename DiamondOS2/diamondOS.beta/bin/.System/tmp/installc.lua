--API download--APIs

--os.loadAPI(settings.get("apiDir").."/wget")

--VERIABLES

local w,h = term.getSize()

--FUNCTIONS

local function printCentered(y,s,clearLine)
	local x = math.floor((w - string.len(s)) / 2)
	term.setCursorPos(x,y)
	if clearLine == true then
		term.clearLine()
	end
	term.write(s)
end

local function updateBar( progress )
	term.setBackgroundColor(colors.lime)
	term.setTextColor(colors.lime)
	term.setCursorPos(14, math.floor(h/2)+1)
	while progress > 0 do
		term.write("|")
		progress = progress - 1
	end
end

local function install(  )
	term.setBackgroundColor(colors.lightGray)
	term.clear()
	term.setTextColor(colors.black)
	printCentered(math.floor(h / 2) - 2, "Downloading APIs...", false)
	term.setCursorPos(1, math.floor(h/2)+1)
	term.setBackgroundColor(colors.gray)
	term.setTextColor(colors.gray)
	printCentered(math.floor(h / 2) + 1, "|||||||||||||||||||||||", false) --23
	local times = 23
	--shell.run("wget https://raw.githubusercontent.com/Mon4ik/tifAPI/master/api.lua "..settings.get("apiDir").."/linker/api.lua")
	updateBar(1)
	sleep(2)
	--shell.run("wget https://raw.githubusercontent.com/Mon4ik/tifAPI/master/api/init.lua "..settings.get("apiDir").."/linker/api/init.lua")
	updateBar(2)
	sleep(4)
	--load(http.get("http://ambernuggets.cc/get/latest").readAll(), "amber", "t", _ENV)(...)
	updateBar(3)
	sleep(2)
	--local installer = multishell.launch("wget run https://github.com/9551-Dev/programs/raw/main/guih_install.lua")
	--multishell.setTitle("API installer")
	--while multishell.getTitle(installer) ~= nil do
	--	sleep(0)
	--end
	updateBar(4)
	sleep(3)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.black)
	printCentered(math.floor(h / 2) - 2, "Downloading OS components...", true)
	sleep(2)
	updateBar(13)
	sleep(2)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.black)
	printCentered(math.floor(h / 2) - 2, "Creating file system...", true)
	sleep(2)
	updateBar(16)
	sleep(2)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.black)
	printCentered(math.floor(h / 2) - 2, "Installing OS...", true)
	sleep(1)
	local BootList = {"/os/.sys/init", "/diamondOS.beta/bin/.boot/init"}
	local SystemName = {"diamondOS", "DiamondOS 2"}
	settings.set("BootList", textutils.serialize(BootList, { compact = true }))
	settings.set("SystemName", textutils.serialize(SystemName, { compact = true }))
	settings.save()
	updateBar(20)
	sleep(2)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.black)
	printCentered(math.floor(h / 2) - 2, "Installing programs...", true)
	sleep(2)
	updateBar(22)
	sleep(2)
	term.setBackgroundColor(colors.lightGray)
	term.setTextColor(colors.black)
	printCentered(math.floor(h / 2) - 2, "Complete! Restarting...", true)
	sleep(2)
	updateBar(23)
	sleep(1)
	--os.reboot()
end

--MAIN

install()