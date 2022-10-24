settings.load()
dtt = {"/diamondOS.beta/bin/.System/systemApps/taskmgr.lua", "Task Manager", "", false}
dt = {dtt}

local t = textutils.unserialize(settings.get("programs"))
local c = 0
local tt = nil

while true do
	term.clear()
	term.setCursorPos(1,1)

	for _ in pairs(t) do
		c = c + 1
	end

	for i = 1, c do
		tt = t[i]
		print(tt[2])
	end
	
	write("\nSelect Program (0 - exit): ")
	local selected = tonumber(read())
	
	if selected == 0 then
		error()
	elseif selected >= 1 and selected <= c then
		tt = t[selected]
		term.clear()
		term.setCursorPos(1,1)
		print("Slected: " .. tt[2])
		if tt[4] == true then
			print("Actions:\n1 - Launch\n2 - Uninstall\n")
		else
			print("Actions:\n1 - Launch")
		end
		local action = tonumber(read())
		if action == 1 then
			local id = multishell.launch({multishell = multishell, term = term, os = os, shell = shell}, tt[1])
			multishell.setTitle(id, tt[2])
			multishell.setFocus(id)
		elseif action == 2 and tt[4] == true then
			local id = multishell.launch({multishell = multishell, term = term, os = os, shell = shell}, tt[3])
			multishell.setTitle(id, tt[2] .. " Uninstaller")
			multishell.setFocus(id)
			table.remove(t, selected)
			settings.set("programs", textutils.serialize(t, {compact = true}))
			settings.save()
		end
	end
end

