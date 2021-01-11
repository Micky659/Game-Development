
Timer = require 'knife.timer'

WINDOW_WIDTH = 384
WINDOW_HEIGHT = 216

MOVEMENT_TIME = 2

function love.load()
	flappySprite = love.graphics.newImage('flappy.png')

	flappy = {x= 0, y =0}

	Timer.tween(MOVEMENT_TIME, {
		[flappy] = {x = WINDOW_WIDTH - flappySprite:getWidth(), y = 0}
		})
	:finish(function()
		Timer.tween(MOVEMENT_TIME, {
		[flappy] = {x = WINDOW_WIDTH - flappySprite:getWidth(), y = WINDOW_HEIGHT - flappySprite:getHeight()}
		})
	:finish(function()
		Timer.tween(MOVEMENT_TIME, {
		[flappy] = {x = 0, y = WINDOW_HEIGHT - flappySprite:getHeight()}
		})
	:finish(function()
		Timer.tween(MOVEMENT_TIME, {
		[flappy] = {x = 0, y = 0}
		})
		end)
	end)
end)


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
	Timer.update(dt)
end

function love.draw()
	love.graphics.draw(flappySprite, flappy.x, flappy.y)
end
