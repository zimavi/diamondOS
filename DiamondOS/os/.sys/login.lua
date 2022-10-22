os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1,1)

settings.load()

local id
local tm

local function printList ()
	tm = textutils.unserialize(settings.get("login"))

	for i in pairs(tm) do 
		local t = tm[i]
		print(i .. " " .. t[1])
	end

	print("\nEnter account ID: ")

	id = tonumber(read())
end

printList()

if id <= pairs(tm) and id >= 1 then
	while true do 
		local t = tm[id]
		term.clear()
		term.setCursorPos(1,1)
		write("Enter password (\"cancel\" to return): ")
		local pass = read("*")
		if pass == t[2] then
			shell.run("/os/.sys/main")
		elseif pass == "cancel" then
			printList()
		else
			print("Password incorrect")
			sleep(3)
		end
	end
end