
function GenerateQuads(texture, width, height)
	local sheetWidth = texture:getWidth() / width
	local sheetHeight = texture:getHeight() / height

	local quadcounter = 1
	local quads = {}

	for y = 0, sheetHeight - 1 do
		for x = 0, sheetWidth - 1 do
			quads[quadcounter] =
			love.graphics.newQuad(x * width, y * height, width, height, texture:getDimensions())
			quadcounter = quadcounter + 1
		end
	end
	return quads 
end


function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	texture = love.graphics.newImage('match3.png')
	quads = GenerateQuads(texture, 32, 32)


	love.window.setMode(512, 288, {
		fullscreen = false
		})
end

function love.keypressed(key)
	if key == 'i' then
		love.event.quit()
	end
end

function love.draw()
	for y = 0, 288, 32 do
		for x = 0, 512, 32 do
	love.graphics.draw(texture, quads[math.random(#quads)], x, y)
end
end
end
