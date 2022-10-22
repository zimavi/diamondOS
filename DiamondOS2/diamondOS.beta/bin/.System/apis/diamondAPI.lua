--VARIABLES

os.loadAPI("/rom/programs/shell.lua")

local bgrPath = settings.get("DiamondOS.cfg.bgr", "/diamondOS.beta/bin/desktop/wallpapers/bgr0.nfp")
local hasAdminPermision = false

--LOCAL

local function finishApp()
	term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
	term.clear()
	term.setCursorPos(1,1)
	shell.run("/os/.sys/main")
	-- error()
end

local function printCentered(y,s,clearLine)
	local x = math.floor((w - string.len(s)) / 2)
	term.setCursorPos(x,y)
	if clearLine == true then
		term.clearLine()
	end
	term.write(s)
end

local function drawdesk()
	deskimage = paintutils.loadImage(bgrPath)
	paintutils.drawImage(deskimage, 1, 1)
	drawhotbar()
end

local function drawhotbar()
	term.setBackgroundColor(colors.gray)
	term.setCursorPos(1,1)
	term.clearLine()
	-- if openedPrograms == true then
	-- 	print("[Menu]  |  [Close]") -- [CLOSE] 12-18
	-- else
	print("[ OS ]")
	-- end
end

local dAPI = {} 

--FUNCTIONS

function dAPI.getTableSize(t)
    local count = 0
    for _, __ in pairs(t) do
        count = count + 1
    end
    return count
end

--function dAPI.preloadAPI( APIname, workDir, t )
--	cPath = settings.get("apiDir").."/"..APIname
-- 	shell.run("cp", cPath, workDir)
--	table.insert(t, workDir.."/"..APIname)
--end
--
--function dAPI.clearLoadedAPIs( t )
--	for i in pairs(t) do
--    	shell.run("delete", t [i])
--    	t [i] = nil
--    end
--end

function dAPI.initWindow(backgroundColor, possibleToClose, isFullscreen)
	local x, y = term.getSize()
	term.setBackgroundColor(backgroundColor)
	term.clear()
	if isFullscreen == false then
		drawhotbar()
		if possibleToClose == true then
			term.setCursorPos(x-2,2)
			term.setTextColor(colors.black)
			term.setBackgroundColor(colors.red)
			print("[X]")
		end
	end
	term.setBackgroundColor(backgroundColor)
end
function dAPI.showDialogWindow(windowName, collection)

end
function dAPI.appClose()
	-- term.clear()
	-- drawdesk()
end
function dAPI.appInit(appName, author, version, path)
	-- collection = settings.get("Apps")
	-- info = {appName, author, version, path}
	-- settings.set("Apps", textutils.serialise({collection, info}, {allow_repetitions = true, compact = true}))
	-- settings.save()
end
function dAPI.accountAskAdminPermission()
end
function dAPI.dShell_Shutdown()
	if hasAdminPermision == true then
		os.shutdown()
	else 
		return false
	end
end
function dAPI.dShell_Reboot()
	if hasAdminPermision == true then
		os.reboot()
	else 
		return false
	end
end

return dAPI

