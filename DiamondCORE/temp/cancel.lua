disk.eject("top")
disk.eject("bottom")
disk.eject("left")
disk.eject("right")
disk.eject("front")
disk.eject("back")

shell.run("/.deletetemp")

term.clear()
term.setCursorPos(1,1)
print("Rebooting...")
sleep(1)
os.reboot()