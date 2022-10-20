os.pullEvent = os.pullEventRaw

settings.load()

local function PrintDoneMsg()
	term.setTextColor(colors.green)
	print("Done.")
	term.setTextColor(colors.white)
end

local function MakeLog( message, error, whileRunning )
	local file = fs.open("/crash_report.log", "w")
	file.write("[CRITICAL ERROR WHILE " .. whileRunning .. "]\n[ERROR] " .. error .. " : " .. message)
	file.close()
end


if settings.get("bootFailed", 0) >= 3 then
	if settings.get("runRecoveryProgram", false) == true then
		if fs.exists("/os/.recovery/recovery.lua") then
			shell.run("/os/.recovery/recovery.lua")
		end
	end
end


term.clear()
term.setCursorPos(1,1)

print("Chacking device characteristics...")

sleep(3)

if not term.isColor() then
	shell.run("/os/.runFiles/BSOD", "\"[DO:0005] Unsupported device\"")
elseif turtle then
	shell.run("/os/.runFiles/BSOD", "\"[DO:0005] Unsupported device\"")
elseif pocket then
	shell.run("/os/.runFiles/BSOD", "\"[DO:0005] Unsupported device\"")
end

PrintDoneMsg()

print("Chacking file integrity...")

sleep(3)

if not fs.exists("/os/.sys/init") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.sys/main") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/.UninstallDialog") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/.command") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/.programs") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/.shutdown") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/.uninstall") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/install") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/programs/getFiles") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/programs/sendFiles") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/programs/web") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
elseif not fs.exists("/os/.runFiles/.sleep") then
	settings.set("bootFailed", settings.get("bootFailed", 0) + 1)
	settings.save()
	MakeLog("CRITICAL FILE DOES NOT EXIST", "DO:0003", "BOOTING")
	shell.run("/os/.runFiles/BSOD", "\"[DO:0003] Critical file corrupted\"")
end

PrintDoneMsg()

settings.set("bootFailed", 0)

print("Botting System...")

sleep(3)

term.clear()
term.setCursorPos(1,1)

settings.save()

shell.run("/os/.sys/init")