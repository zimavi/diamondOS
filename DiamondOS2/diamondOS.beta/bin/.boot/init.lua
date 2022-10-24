os.pullEvent = os.pullEventRaw

settings.load("/.settings")

shell.run("cp", "/"..settings.get("apiDir").."/diamondAPI.lua", "/"..settings.get("bootDir"))
local dAPI = require("diamondAPI")

w,h = term.getSize()

local function printCentered(y,s,clearLine)
	local x = math.floor((w - string.len(s)) / 2)
	term.setCursorPos(x,y)
	if clearLine == true then
		term.clearLine()
	end
	term.write(s)
end

local BootList = textutils.unserialize(settings.get("BootList"))
local SystemName = textutils.unserialize(settings.get("SystemName"))

if table.getn(BootList) < 1 and BootList[1] ~= nil then
	shell.run("delete", "/"..settings.get("bootDir").."/diamondAPI.lua")
	--shell.run(BootList[1])
elseif table.getn(BootList) > 1 then
	while true do
		term.setBackgroundColor(colors.white)
		term.clear()
		term.setCursorPos(1,1)
		term.setTextColor(colors.black)
		print("Diamond UEFI // //\n\n\n")
		for i=1, table.getn(BootList) do
			print("   "..i..") "..BootList[i].." | "..SystemName[i])
		end
		write("\n\nPlease write number of boot file: ")	
		choice = tonumber(read())
		if type(choice) == "number" and choice >= 1 and choice <= dAPI.getTableSize(BootList) then
			break
		end
	end
	term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("delete", "/"..settings.get("bootDir").."/diamondAPI.lua")
	--shell.run(BootList[choice])
else
	term.clear()

	printCentered(math.floor(h/2) - 2, "Diamond EFI", false)
	printCentered(math.floor(h/2) + 0, "Error (DE10634) while botting...", false)
	printCentered(math.floor(h/2) + 1, "There is not boot config,", false)
	printCentered(math.floor(h/2) + 2, "unable to boot.", false)
	printCentered(math.floor(h/2) + 3, "We can not solve this problam", false)
	printCentered(math.floor(h/2) + 4, "Ask Diamond Inc. for help", false)
	printCentered(math.floor(h/2) + 6, "Press any key to shutdown computer.", false)
	term.setCursorBlink(false)

	os.pullEvent("key")
	shell.run("delete", "/"..settings.get("bootDir").."/diamondAPI.lua")
	os.shutdown()
end
