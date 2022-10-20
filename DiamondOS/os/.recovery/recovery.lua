os.pullEvent = os.pullEventRaw

settings.load()

local function MakeLog( message, error, whileRunning )
	local file = fs.open("/crash_report.log", "w")
	file.write("[CRITICAL ERROR WHILE " .. whileRunning .. "]\n[ERROR] " .. error .. " : " .. message)
	file.close()
end

print("Welcome to recovery programm!\n")
print("We are looking for a problem on your")
print("computer to try recover it!")

sleep(7)

local cc = 0

if not fs.exists("/os/.sys/init") then
	cc = cc + 1
end
if not fs.exists("/os/.sys/main") then
	cc = cc + 1
end
if not fs.exists("/os/.runFiles/.UninstallDialog") then
	cc = cc + 1
end
if not fs.exists("/os/.runFiles/.command") then
	cc = cc + 1
end
if not fs.exists("/os/.runFiles/programs") then
	cc = cc + 1
end
if not fs.exists("/os/.runFiles/.shutdown") then
	cc = cc + 1
end
if not fs.exists("/os/.runFiles/.uninstall") then
	cc = cc + 1
end
if not fs.exists("/os/.runFiles/install") then
	cc = cc + 1
end
if not fs.exists("/os/programs/getFiles") then
	cc = cc + 1
end
if not fs.exists("/os/programs/sendFiles") then
	cc = cc + 1
end
if not fs.exists("/os/programs/web") then
	cc = cc + 1
end

term.clear()
term.setCursorPos(1,1)

if cc <= 3 then
	print("\nWe found problem and we are recovering")
	print("your computer!")
	sleep(5)
	if not fs.exists("/os/.sys/init") then
		shell.run("pastebin get MKAUF1aB /os/.sys/init")
	end
	if not fs.exists("/os/.sys/main") then
		shell.run("pastebin get tdiZwXAi /os/.sys/main")
	end
	if not fs.exists("/os/.runFiles/.UninstallDialog") then
		shell.run("pastebin get zdSEmGNM /os/.runFiles/.UninstallDialog")
	end
	if not fs.exists("/os/.runFiles/.command") then
		shell.run("pastebin get nH47yXMJ /os/.runFiles/.command")
	end
	if not fs.exists("/os/.runFiles/.programs") then
		shell.run("pastebin get u5nCuSmc /os/.runFiles/.programs")
	end
	if not fs.exists("/os/.runFiles/.shutdown") then
		shell.run("pastebin get T4hMDcjM /os/.runFiles/.shutdown")
	end
	if not fs.exists("/os/.runFiles/.uninstall") then
		shell.run("pastebin get dvFUiJ7k /os/.runFiles/.uninstall")
	end
	if not fs.exists("/os/.runFiles/install") then
		shell.run("pastebin get pRKZLKge /os/.runFiles/install")
	end
	if not fs.exists("/os/programs/getFiles") then
		shell.run("pastebin get XVFay6kL /os/programs/getFiles")
	end
	if not fs.exists("/os/programs/sendFiles") then
		shell.run("pastebin get eggHuRDr /os/programs/sendFiles")
	end
	if not fs.exists("/os/programs/web") then
		shell.run("pastebin get n0TYWPg0 /os/programs/web")
	end
	print("Rebooting in 3 seconds")
	sleep(3)
	settings.set("bootFailed", 0)
	settings.save()
	os.reboot()
else
	print("\nUnfortunately we can not restore")
	print("your computer :(")
	print("\nPress \"Enter\" to shutdown your")
	print("computer")
	read("")
	os.shutdown()
end