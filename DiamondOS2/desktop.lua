--variables

local w,h = term.getSize()
bgrPath = settings.get("DiamondOS.cfg.bgr", "/diamondOS.beta/bin/desktop/wallpapers/bgr0.nfp")
openedMenu = false
openedPrograms = false

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
	openedPrograms = false
end

local function drawdesk()
	term.clear()
	term.setCursorPos(1,1)
	deskimage = paintutils.loadImage(bgrPath)
	paintutils.drawImage(deskimage, 1, 1)
	drawhotbar()
end

function drawhotbar()
	term.setBackgroundColor(colors.gray)
	term.setCursorPos(1,1)
	term.clearLine()
	if openedPrograms == true then
		print("[ OS ]  |  [Close]") -- [CLOSE] 12-18
	else
		print("[ OS ]")
	end
end

function showAboutWindow()
	resetwindows()
	drawdesk()
	id = os.getComputerID()
	if id >= 100 then
		printCetered(math.floor(h / 2) - 3,"+----------[About]-------[X]+", false)
		printCetered(math.floor(h / 2) - 2,"|     OS: Diamond OS 2      |", false)
		printCetered(math.floor(h / 2) - 1,"|       Editon: Beta        |", false)
		printCetered(math.floor(h / 2) - 0,"|          ID: "..id.."          |", false)
		printCetered(math.floor(h / 2) + 1,"|                           |", false)
		printCetered(math.floor(h / 2) + 2,"|          [Close]          |", false)
		printCetered(math.floor(h / 2) + 3,"+---------------------------+", false)
	elseif id < 100 then
		printCetered(math.floor(h / 2) - 3,"+----------[About]-------[X]+", false)
		printCetered(math.floor(h / 2) - 2,"|     OS: Diamond OS 2      |", false)
		printCetered(math.floor(h / 2) - 1,"|       Editon: Beta        |", false)
		printCetered(math.floor(h / 2) - 0,"|          ID: 0"..id.."          |", false)
		printCetered(math.floor(h / 2) + 1,"|        Build: 1013        |")
		printCetered(math.floor(h / 2) + 2,"|                           |", false)
		printCetered(math.floor(h / 2) + 3,"|          [Close]          |", false)
		printCetered(math.floor(h / 2) + 4,"+---------------------------+", false)
	end
end

function menu()
end

function main()
	event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 then
		if y == 1 and x >= 1 and x <= 6 then
			openedMenu = true
			print("[ Programs ]")
			print("            ")
			print("[ Shutdown ]")
			print("[  Reboot  ]")
			print("[   Exit   ]")
			print("            ")
			print("[   About  ]")
		elseif y == 2 and x >= 1 and x <= 12 and openedMenu == true then
			openedPrograms = true
			openedMenu = false
			term.setBackgroundColor(colors.black)
			term.clear()
			drawhotbar()
		elseif y == 4 and x >= 1 and x <= 12 and openedMenu == true then
			os.shutdown()
		elseif y == 5 and x >= 1 and x <= 12 and openedMenu == true then
			os.reboot()
		elseif y == 6 and x >= 1 and x <= 12 and openedMenu == true then
			finishApp()
		elseif y == 8 and x >= 1 and x <= 12 and openedMenu == true then
			showAboutWindow()
		elseif y == 1 and x >= 12 and x <= 18 and openedPrograms == true then
			resetwindows()
			drawdesk()
		else
			if openedPrograms == true then
				term.setBackgroundColor(colors.black)
				term.clear()
				drawhotbar()
			else
				drawdesk()
				resetwindows()
			end
		end
	end
	main()
end

--main code
drawdesk()
main()