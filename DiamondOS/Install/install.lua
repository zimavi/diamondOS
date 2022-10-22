os.pullEvent = os.pullEventRaw
 
term.clear()
term.setCursorPos(1,1)
 
deletedone = false
 
print("Deleting pre-exists files...")
if fs.exists("/startup") then
    shell.run("rm", "/startup")
    term.setTextColor(colors.red)
    textutils.slowPrint("###########")
    deletedone = true
end
if fs.exists("/os") then
    shell.run("rm", "/os")
    textutils.slowPrint("###########")
    deletedone = true
end
if fs.exists("/back") then
    shell.run("rm", "/back")
    textutils.slowPrint("###########")
    deletedone = true
end
if deletedone == true then
    term.setTextColor(colors.green)
    print("Deleted!")
else
    term.setTextColor(colors.red)
    print("No files to delete")
end
sleep(1)
term.setTextColor(colors.white)
 
print("Copying fils...")
shell.run("cp", "/disk/bios/startup.bios", "/startup")
term.setTextColor(colors.red)
textutils.slowPrint("###########")
shell.run("cp", "/disk/diamondOS/os", "/os")
textutils.slowPrint("###########")
shell.run("cp", "/disk/diamondOS/back.lua", "/back")
textutils.slowPrint("###########")
term.setTextColor(colors.green)
print("Copyed!")
term.setTextColor(colors.white)
sleep(1)
----------------------------------
settings.set("bootFile", "/os/.boot/boot.lua")
settings.save()
print("Deleting temp files")
sleep(1)
shell.run("/.deletetemp")
term.setTextColor(colors.red)
textutils.slowPrint("###########")
term.setTextColor(colors.green)
print("Done.")
term.setTextColor(colors.white)
sleep(1)
 
disk.eject("top")
disk.eject("bottom")
disk.eject("left")
disk.eject("right")
disk.eject("front")
disk.eject("back")

term.clear()
term.setCursorPos(1,1)

print("Welcome to DiamondOS first setup!")
print("\nTo secure your data, you need to create an account.")
write("Please enter account name: ")
local login = read()
write("Please enter account password: ")
local pass = read()

settings.load()
local t = { login, pass }
local tm = { t }
settings.set("login", textutils.serialize(tm, {compact = true}))
settings.save()

term.clear()
term.setCursorPos(1,1)

print("Thanks, we are preparing your PC for work!")

sleep(15)

os.reboot()
 