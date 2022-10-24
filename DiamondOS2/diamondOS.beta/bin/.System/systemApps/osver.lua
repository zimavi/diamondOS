os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

--Took from desktop mk1
local function printCetered(y,s,clearLine)
	local x = math.floor((w - string.len(s)) / 2)
	term.setCursorPos(x,y)
	if clearLine == true then
		term.clearLine()
	end
	term.write(s)
end
--Took from desktop mk1
function showAboutWindow()
	id = os.getComputerID()
	term.setBackgroundColor(colors.gray)
	if id >= 100 then
		printCetered(math.floor(h / 2) - 3,"+----------[About]----------+", false)
		printCetered(math.floor(h / 2) - 2,"|     OS: Diamond OS 2      |", false)
		printCetered(math.floor(h / 2) - 1,"|        Editon: Dev        |", false)
		printCetered(math.floor(h / 2) - 0,"|          ID: "..id.."          |", false)
		printCetered(math.floor(h / 2) + 1,"|        Build: 1014        |")
		printCetered(math.floor(h / 2) + 1,"|                           |", false)
		printCetered(math.floor(h / 2) + 2,"|          [Close]          |", false)
		printCetered(math.floor(h / 2) + 3,"+---------------------------+", false)
	elseif id < 100 and id >= 10 then
		printCetered(math.floor(h / 2) - 3,"+----------[About]----------+", false)
		printCetered(math.floor(h / 2) - 2,"|     OS: Diamond OS 2      |", false)
		printCetered(math.floor(h / 2) - 1,"|        Editon: Dev        |", false)
		printCetered(math.floor(h / 2) - 0,"|          ID: 0"..id.."          |", false)
		printCetered(math.floor(h / 2) + 1,"|        Build: 1014        |")
		printCetered(math.floor(h / 2) + 2,"|                           |", false)
		printCetered(math.floor(h / 2) + 3,"|          [Close]          |", false)
		printCetered(math.floor(h / 2) + 4,"+---------------------------+", false)
	elseif id < 10 then
		printCetered(math.floor(h / 2) - 3,"+----------[About]----------+", false)
		printCetered(math.floor(h / 2) - 2,"|     OS: Diamond OS 2      |", false)
		printCetered(math.floor(h / 2) - 1,"|        Editon: Dev        |", false)
		printCetered(math.floor(h / 2) - 0,"|          ID: 00"..id.."          |", false)
		printCetered(math.floor(h / 2) + 1,"|        Build: 1014        |")
		printCetered(math.floor(h / 2) + 2,"|                           |", false)
		printCetered(math.floor(h / 2) + 3,"|          [Close]          |", false)
		printCetered(math.floor(h / 2) + 4,"+---------------------------+", false)
	end
end

showAboutWindow()

while true do
	event, button, x, y = os.pullEvent("mouse_click")
	if button == 1 then
		if y == 12 and x >= 22 and x <= 28 then
			break
		end
		if y == 6 and x >= 36 and x <= 28 then
			break
		end
	end
end