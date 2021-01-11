WINDOW_WIDTH = 384
WINDOW_HEIGHT = 316

function love.load()
currentSecond = 0 
secondTimer = 0
currentSecond2 = 0 
secondTimer2 = 0
currentSecond3 = 0 
secondTimer3 = 0
currentSecond4 = 0 
secondTimer4 = 0
currentSecond5 = 0 
secondTimer5 = 0

love.graphics.setDefaultFilter('nearest', 'nearest')

love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
	fullscreen = false,
	resizable = false,
	vsync = true
	})
end

function love.keypressed(key)
	if key == 'i' then
		love.event.quit()
	end
end

function love.update(dt)
	secondTimer = secondTimer + dt

	if secondTimer > 1 then
		currentSecond = currentSecond + 1
		secondTimer = secondTimer % 1
	end

		secondTimer2 = secondTimer2 + dt

	if secondTimer2 > 2 then
		currentSecond2 = currentSecond2 + 1
		secondTimer2 = secondTimer2 % 1
	end

		secondTimer3 = secondTimer3 + dt

	if secondTimer3 > 3 then
		currentSecond3 = currentSecond3 + 1
		secondTimer3 = secondTimer3 % 1
	end

		secondTimer4 = secondTimer4 + dt

	if secondTimer4 > 4 then
		currentSecond4 = currentSecond4 + 1
		secondTimer4 = secondTimer4 % 1
	end

		secondTimer5 = secondTimer5 + dt

	if secondTimer5 > 5 then
		currentSecond5 = currentSecond5 + 1
		secondTimer5 = secondTimer5 % 1
	end
end

function love.draw()
	love.graphics.printf('Timer: ' .. tostring(currentSecond) .. ' seconds (every 1 sec)', 0, WINDOW_HEIGHT / 2 - 68, WINDOW_WIDTH, 'center')
	love.graphics.printf('Timer: ' .. tostring(currentSecond2) .. ' seconds (every 2 sec)', 0, WINDOW_HEIGHT / 2 - 82, WINDOW_WIDTH, 'center')
	love.graphics.printf('Timer: ' .. tostring(currentSecond3) .. ' seconds (every 3 sec)', 0, WINDOW_HEIGHT / 2 - 96, WINDOW_WIDTH, 'center')
	love.graphics.printf('Timer: ' .. tostring(currentSecond4) .. ' seconds (every 4 sec)', 0, WINDOW_HEIGHT / 2 - 110, WINDOW_WIDTH, 'center')
	love.graphics.printf('Timer: ' .. tostring(currentSecond5) .. ' seconds (every 5 sec)', 0, WINDOW_HEIGHT / 2 - 124, WINDOW_WIDTH, 'center')
end
