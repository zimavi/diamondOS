--os.pullEvent = os.pullEventRaw

local c 
local selected = -1

local function updateList(  )
	term.clear()
	term.setCursorPos(1,1)
	c = multishell.getCount()
	if selected == -1 then
		for i = 1, c do
			print("ID: " .. i .. "| Name: " .. multishell.getTitle(i))
		end
		print("\nSelect ID (-1 - exit, 0 - update): ")
	else
		print("[Selected] ID: " .. selected .. "| Name: " .. multishell.getTitle(selected))
		print("Actions:\n1 - Set title\n2 - DONT WORK\n3 - Return")
		local option = tonumber(read())
		if option == 1 then
			print("\nEnter title: ")
			multishell.setTitle(selected, read())
			selected = -1
			updateList()
		elseif option == 2 then
			--print(shell.completeProgram(multishell.getTitle(selected)))
			print("I TOLD DONT WORK")
			read("")
			selected = -1
			updateList()
		else
			selected = -1
			updateList()
		end
	end
end

sleep(1)

while true do
	updateList()
	local id = tonumber(read())
	if id == -1 then
		break
	elseif id >= 1 and id <= multishell.getCount() then
		selected = id
	end
end