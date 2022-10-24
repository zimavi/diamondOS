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

local function getTableSize( T )
	local count = 0
  	for _ in pairs( T ) do count = count + 1 end
  	return count
end

printList()

if id <= getTableSize(tm) and id >= 1 then
	while true do 
		local t = tm[id]
		term.clear()
		term.setCursorPos(1,1)
		write("Enter password (\"cancel\" to return): ")
		local pass = read("*")
		if pass == t[2] then
			break
		elseif pass == "cancel" then
			printList()
		else
			print("Password incorrect")
			sleep(3)
		end
	end
else
	os.reboot()
end

shell.run("/os/.sys/main")