Timer = require 'knife.timer'

WINDOW_WIDTH = 384
WINDOW_HEIGHT = 216

function love.load()
	interval = {1, 2, 4, 3, 2, 8}

	counters = {0, 0, 0, 0, 0, 0}

	for i = 1, 6 do
		Timer.every(interval[i], function()
			counters[i] = counters[i] + 1
			end)
	end

    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    Timer.update(dt)
end

function love.draw()
					
	for i = 1, 6 do

		love.graphics.printf('Timer: ' .. tostring(counters[i]) ..' seconds (very ' .. tostring(interval[i]) .. ')', 0, 54 + i * 16, WINDOW_WIDTH, 'center')
	end
end
