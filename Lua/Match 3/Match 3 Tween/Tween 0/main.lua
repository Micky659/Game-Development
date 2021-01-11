WINDOW_WIDTH = 384
WINDOW_HEIGHT = 216

MOVE_DURATION = 2

function love.load()
	flappySprite = love.graphics.newImage('flappy.png')

	flappyX, flappyY = 0, WINDOW_HEIGHT / 2 - 8

	timer = 0

	endX = WINDOW_WIDTH - flappySprite:getWidth()

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
		if timer < MOVE_DURATION then
			timer = timer + dt


			flappyX = math.min(endX, endX * (timer / MOVE_DURATION))
		end
	end

	function love.draw()
		love.graphics.draw(flappySprite, flappyX, flappyY)
		love.graphics.print(tostring(timer), 4, 4)
	end