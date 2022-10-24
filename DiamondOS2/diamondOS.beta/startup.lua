os.pullEvent = os.pullEventRaw

settings.set("temp", "diamondOS.beta/bin/.System/tmp")
settings.set("sysDir", "diamondOS.beta/bin/.System")
settings.set("apiDir", "diamondOS.beta/bin/.System/apis")
settings.set("bootDir", "diamondOS.beta/bin/.boot")
settings.set("sysAppDir", "diamondOS.beta/bin/.System/systemApps")
settings.save()

function downloadItem( pastebin, path, fileName )
	tPath = "/"..path.."/"..fileName
	shell.run("pastebin", "get", pastebin, tPath)
	return tPath
end
function runItem(pastebin)
	shell.run("pastebin", "run", pastebin)
	return true
end
function deleteItem( path )
	shell.run("delete", "/"..path)
end
function copyItem( path, path2, needDelOrg )
	shell.run("cp", "/"..path, "/"..path2)
	if needDelOrg then deleteItem(path); end
	return "/"..path2
end
function ejectAll()
	if disk.isPresent("top") then
		disk.eject("top")
	elseif disk.isPresent("bottom") then
		disk.eject("bottom")
	elseif disk.isPresent("right") then
		disk.eject("right")
	elseif disk.isPresent("left") then
		disk.eject("left")
	elseif disk.isPresent("front") then
		disk.eject("front")
	elseif disk.isPresent("back") then
		disk.eject("back")
	else
		return false
	end
	return true
end
function clear()
	term.clear()
	term.setCursorPos(1,1)
end

multishell.setTitle(multishell.getCurrent(), "Installer")

term.clear()
term.setCursorPos(1,1)

print("Welcome to Diamond OS installer.")
print("Type \"install\" to install, and type \"cancel\" to cancel.")
while true do
	write("> ")
	input = read()
	if input == "install" then
		break
	elseif input == "cancel" then
		ejectAll()
		os.reboot()
	end
end
clear()
print("downloading APIs...")
shell.run("mkdir", "diamondOS.beta")
shell.run("mkdir", "diamondOS.beta/bin")
shell.run("mkdir", "diamondOS.beta/bin/.boot")
shell.run("mkdir", "diamondOS.beta/bin/desktop")
shell.run("mkdir", "diamondOS.beta/bin/desktop/wallpapers")
shell.run("mkdir", "diamondOS.beta/bin/.System")
shell.run("mkdir", "diamondOS.beta/bin/.System/apis")
shell.run("mkdir", "diamondOS.beta/bin/.System/tmp")

downloadItem("ivVMZ7YM", settings.get("apiDir"), "diamondAPI")
downloadItem("QWfprnT", settings.get("apiDir"), "wget")
downloadItem("W5ZkVYSi", settings.get("apiDir"), "gitget")
--local id = multishell.launch({}, "/diamondOS.beta/bin/apis/wget")
path = downloadItem("5qQ6t6ZX", settings.get("temp"), "YAGUI_downloader.lua")
id = multishell.launch({}, path);
multishell.setTitle(id, "API");
sleep(10)
copyItem("YAGUI.lua", settings.get("apiDir").."/YAGUI.lua", true)
copyItem("WSS_Client.lua", settings.get("apiDir").."/WSS_Client.lua", true)
copyItem("HPainter.lua", settings.get("apiDir").."/HPainter.lua", true)
--shell.run("wget https://raw.githubusercontent.com/Mon4ik/tifAPI/master/api.lua "..settings.get("apiDir").."/linker/api.lua")
--shell.run("wget https://raw.githubusercontent.com/Mon4ik/tifAPI/master/api/init.lua "..settings.get("apiDir").."/linker/api/init.lua")
downloadItem("WpnbkREi", settings.get("apiDir"), "gui.lua")
print("Done.")
sleep(1)
print("Restarting...")
settings.set("bootOld", settings.get("bootFile"))
settings.set("bootFile", settings.get("temp").."/install.lua")
settings.save()