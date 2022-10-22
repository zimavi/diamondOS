--API REQIRES
local gui = require('gui')

--FUNCTIONS



--VERIABLES
local root = gui.Root:new()

local box = gui.LinearContainer:new(root,2,1,5)

local lbl = gui.Label:new(root,"Welcome to Diamond OS installer!")
local lbl2 = gui.Label:new(root, "Select install mode")
local btn1 = gui.Button:new(root,"install OS")
local btn2 = gui.Button:new(root,"install APIs")
local btn3 = gui.Button:new(root,"Exit")
btn2.enabled = false

--BUTTONS FUNCTIONS

function btn1:onPressed()
	shell.run(settings.get("temp").."/installc.lua")
    --root:onLayout() -- redraw entire screen
end
function btn3:onPressed()
	term.setBackgroundColor(colors.black)
	term.setTextColor(colors.white)
	term.clear()
	term.setCursorPos(1,1)
	error()
end

--CHILD

root:addChild(box)

box:addChild(lbl,false,false,gui.LinearAlign.START)
box:addChild(lbl2,false,false,gui.LinearAlign.START)
box:addChild(btn1,false,false,gui.LinearAlign.START)
box:addChild(btn2,false,false,gui.LinearAlign.START)
box:addChild(btn3,false,false,gui.LinearAlign.START)

--MAIN LOOP
root:mainLoop()