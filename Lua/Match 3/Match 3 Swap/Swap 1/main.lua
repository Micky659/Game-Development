require 'Util'

WINDOW_WIDTH = 512
WINDOW_HEIGHT = 288

function love.load()
	tileSprite = love.graphics.newImage('match3.png')

	tileQuads = GenerateQuads(tileSprite, 32, 32)

	board = generateBoard()

	highlightedTile = false
	highlightedX, highlightedY = 1, 1

	selectedTile = board[1][1]

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

		local x, y = selectedTile.gridX, selectedTile.gridY

		if key == 'up' then
			if y > 1 then
				selectedTile = board[y - 1][x]
			end
			elseif key == 'down' then
				if y < 8 then
					selectedTile = board[y + 1][x]
				end
				elseif key == 'left' then
					if x > 1 then
						selectedTile = board[y][x - 1]
					end
					elseif key == 'right' then
						if x < 8 then
							selectedTile = board[y][x + 1]
						end
					end

					if key == 'enter' or key == 'return' then
						if not highlightedTile then
							highlightedTile = true 
							highlightedX, highlightedY = selectedTile.gridX, selectedTile.gridY
						else

							local tile1 = selectedTile
							local tile2 = board[highlightedY][highlightedX]

							local tempX, tempY = tile2.x, tile2.y
							local tempgridX, tempgridY = tile2.gridX, tile2.gridY

							local temptile = tile1
							board[tile1.gridY][tile1.gridX] = tile2
							board[tile2.gridY][tile2.gridX] = temptile

							tile2.x, tile2.y = tile1.x, tile1.y
							tile2.gridX, tile2.gridY = tile1.gridX, tile1.gridY
							tile1.x, tile1.y = tempX, tempY
							tile1.gridX, tile1.gridY = tempgridX, tempgridY

							highlightedTile = false 

							selectedTile = tile2
						end
					end

					if highlightedTile then 
					if key == 'backspace' then 
					highlightedTile = false 
					end
					end 				

	end

	function love.update(dt)

	end


	function love.draw()
		drawBoard(128, 16)
	end

	function generateBoard()
		local tiles = {}

		for y = 1, 8 do

			table.insert(tiles, {})

			for x = 1, 8 do

				table.insert(tiles[y], {
					x = (x - 1) * 32,
					y = (y - 1) * 32,

					gridX = x,
					gridY = y,

					tile = math.random(#tileQuads)
					})
			end
		end

		return tiles
	end

	function drawBoard(offsetX, offsetY)
		love.graphics.setColor(255, 255, 255, 255)
			for y = 1, 8 do

				for x = 1, 8 do
					local tile = board[y][x]

					love.graphics.draw(tileSprite, tileQuads[tile.tile], tile.x + offsetX, tile.y + offsetY)

					if highlightedTile then
						if tile.gridX == highlightedX and tile.gridY == highlightedY then
							love.graphics.setColor(255, 255, 255, 128)
							love.graphics.rectangle('fill', tile.x + offsetX, tile.y + offsetY, 32, 32, 4)
							love.graphics.setColor(255, 255, 255, 255)
						end																	
					end
				end
			end

			love.graphics.setColor(255, 0, 0, 234)

			love.graphics.setLineWidth(4)

			love.graphics.rectangle('line', selectedTile.x + offsetX, selectedTile.y + offsetY, 32, 32, 4)
		end










