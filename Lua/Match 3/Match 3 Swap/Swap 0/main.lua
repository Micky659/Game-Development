require 'Util'

WINDOW_WIDTH = 512
WINDOW_HEIGHT = 288

function love.load()
	tileSprite = love.graphics.newImage('match3.png')

	tileQuads = GenerateQuads(tileSprite, 32, 32)

	board = generateBoard()

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

					tile = math.random(#tileQuads)
					})
			end
		end

		return tiles
	end

	function drawBoard(offsetX, offsetY)
			for y = 1, 8 do

				for x = 1, 8 do
					local tile = board[x][y]

					love.graphics.draw(tileSprite, tileQuads[tile.tile], tile.x + offsetX, tile.y + offsetY)
				end
			end
		end









