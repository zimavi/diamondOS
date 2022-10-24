os.pullEvent = os.pullEventRaw


while true do
	term.clear()
	term.setCursorPos(1,1)

	print("1 - Exit\n0 - Continue")
	local c = tonumber(read())
	if c == 1 then
		break
	elseif c == 0 then
		term.clear()
		term.setCursorPos(1,1)

		write("Enter first number: ")
		a = tonumber(read())
		write("Enter second number: ")
		b = tonumber(read())

		write("Enter Symbol (/ - divide, * - multipliy, + - plus, - - minus): ")
		symbol = read()
		if symbol == "/" then
			term.clear()
			term.setCursorPos(1,1)

			if b ~= 0 then
				print(a/b)
			else
				shell.run("/os/.runFiles/BSOD")
			end
		elseif symbol == "*" then
			term.clear()
			term.setCursorPos(1,1)

			print(a*b)
		elseif symbol == "+" then
			term.clear()
			term.setCursorPos(1,1)

			print(a+b)
		elseif symbol == "-" then
			term.clear()
			term.setCursorPos(1,1)

			print(a-b)
		else
		end
		read("")
	end
end