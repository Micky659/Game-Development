WINDOW_WIDTH = 384
WINDOW_HEIGHT = 216

TIMER_MAX = 10

function love.load()
	flappySprite = love.graphics.newImage('flappy.png')

	birds = {}

	for i = 1, 1000 do
		table.insert(birds, {
			x = 0,
			y = math.random(WINDOW_HEIGHT - 24),
			rate = math.random() + math.random(TIMER_MAX - 1)
			})
	end

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
		if timer < TIMER_MAX then
			timer = timer + dt

			for k, bird in pairs(birds) do
			bird.x = math.min(endX, endX * (timer / bird.rate))
		end
	end
end

	function love.draw()
		for k, bird in pairs(birds) do
		love.graphics.draw(flappySprite, bird.x, bird.y)
	end

		love.graphics.print(tostring(timer), 4, 4)
		love.graphics.print('FPS :'.. tostring(love.timer.getFPS()), 4, WINDOW_HEIGHT - 16)
	end