os.pullEvent = os.pullEventRaw
--variables

local w,h = term.getSize()
bgrColor = settings.get("DiamondOS.cfg.bgrC", "/diamondOS.beta/bin/desktop/wallpapers/bgrC.nfp")
bgrPath = settings.get("DiamondOS.cfg.bgr", "/diamondOS.beta/bin/desktop/wallpapers/bgr0.nfp")
openedMenu = false

--functions

local function finishApp()
	term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
	term.clear()
	term.setCursorPos(1,1)
	--shell.run("/os/.sys/main")
	error()
end

local function printCetered(y,s,clearLine)
	local x = math.floor((w - string.len(s)) / 2)
	term.setCursorPos(x,y)
	if clearLine == true then
		term.clearLine()
	end
	term.write(s)
end

local function resetwindows()
	openedMenu = false
end

local function drawdesk()
	term.clear()
	term.setCursorPos(1,1)
	deskimage = paintutils.loadImage(bgrColor)
	paintutils.drawImage(deskimage, 1, 1)
	deskimage = paintutils.loadImage(bgrPath)
	paintutils.drawImage(deskimage, 1, 1)
	drawhotbar()
end

function drawhotbar()
	term.setBackgroundColor(colors.gray)
	term.setCursorPos(1,1)
	term.clearLine()
	print("[ OS ]")
end

function menu()
end

function main()
	event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 then
		if y == 1 and x >= 1 and x <= 6 and openedMenu == false then
			openedMenu = true
			print("[ Programs ]")
			print("            ")
			print("[ Shutdown ]")
			print("[  Reboot  ]")
			print("[   Exit   ]")
			print("            ")
			print("[   About  ]")
			--print("[  TaskMGR ]")
		elseif y == 2 and x >= 1 and x <= 12 and openedMenu == true then
			drawdesk()
			drawhotbar()
			openedMenu = false
			local id = multishell.launch({multishell = multishell, term = term, os = os, shell = shell, settings = settings, textutils = textutils}, "/diamondOS.beta/bin/.System/systemApps/proglist.lua")
			multishell.setTitle(id, "Program List")
			multishell.setFocus(id)
		elseif y == 4 and x >= 1 and x <= 12 and openedMenu == true then
			os.shutdown()
		elseif y == 5 and x >= 1 and x <= 12 and openedMenu == true then
			os.reboot()
		elseif y == 6 and x >= 1 and x <= 12 and openedMenu == true then
			finishApp()
		elseif y == 8 and x >= 1 and x <= 12 and openedMenu == true then
			drawdesk()
			drawhotbar()
			openedMenu = false
			local id = multishell.launch({os = os}, "/diamondOS.beta/bin/.System/systemApps/osver.lua")
			multishell.setTitle(id, "About")
			multishell.setFocus(id)
		--elseif y == 9 and x >= 1 and x <= 12 and openedMenu == true then
		--	drawdesk()
		--	drawhotbar()
		--	openedMenu = false
		--	local id = multishell.launch({multishell = multishell, term = term, os = os, shell = shell}, "/diamondOS.beta/bin/.System/systemApps/taskmgr.lua")
		--	multishell.setTitle(id, "Task Manager")
		--	multishell.setFocus(id)
		else
			drawdesk()
			resetwindows()
		end
	end
	main()
end

--main code
drawdesk()
main()