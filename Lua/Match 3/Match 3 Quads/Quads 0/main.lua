function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	texture = love.graphics.newImage('match3.png')

	love.window.setMode(384, 288, {
		fullscreen = false
		})
end

function love.keypressed(key)
	if key == 'i' then
		love.event.quit()
	end
end

function love.draw()
	love.graphics.draw(texture)
end