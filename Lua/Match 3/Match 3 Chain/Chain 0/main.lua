WINDOW_WIDTH = 384
WINDOW_HEIGHT = 216

MOVEMENT_TIME = 2

function love.load()
	flappySprite = love.graphics.newImage('flappy.png')

	flappyX, flappyY = 0, 0

	baseX, baseY = flappyX, flappyY

	timer = 0

	destinations = {
	[1] = {x = WINDOW_WIDTH - flappySprite:getWidth(), y = 0},
	[2] = {x = WINDOW_WIDTH - flappySprite:getWidth(), y = WINDOW_HEIGHT - flappySprite:getHeight()},
	[3] = {x = 0, y = WINDOW_HEIGHT - flappySprite:getHeight()},
	[4] = {x = 0, y = 0}
}

for k, destination in pairs(destinations) do
	destination.reached = false 
end

    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })
end

function love.keypressed(key)
    if key == 'i' then
        love.event.quit()
    end
end

function love.update(dt)
	timer = math.min(MOVEMENT_TIME, timer + dt)

	for i, destination in ipairs(destinations) do
		if not destination.reached then 
			flappyX, flappyY = 

			baseX + (destination.x - baseX) * timer / MOVEMENT_TIME,
			baseY + (destination.y - baseY) * timer / MOVEMENT_TIME

			if timer == MOVEMENT_TIME then
				destination.reached = true 
				baseX, baseY = destination.x, destination.y
				timer = 0
			end

			break

		end
		if baseX == 0 and baseY == 0 then
			for k, destination in pairs(destinations) do
	destination.reached = false 
	MOVEMENT_TIME = MOVEMENT_TIME - 0.1
end
end
	end
end

function love.draw()
	love.graphics.draw(flappySprite, flappyX, flappyY)
end
