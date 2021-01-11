-- Split the spritesheet by evenly dividing it
-- Break up quads according to the measurments
-- we retriver 16 paddles from sheet of 4 color each of 4 sizes- small, medium, large, giant

function GenerateQuads(atlas, titlewidth, titleheight)
	local sheetWidth = atlas:getWidth() / titlewidth
	local sheetHeight = atlas:getHeight() / titleheight

	local sheetcounter = 1
	local spritesheet = {}

	for y = 0, sheetHeight - 1 do
		for x = 0, sheetWidth - 1 do
			spritesheet[sheetcounter] = 
			 love.graphics.newQuad(x * titlewidth, y * titleheight, titlewidth, titleheight, atlas:getDimensions())
			 sheetcounter = sheetcounter + 1
			end
		end
		return spritesheet
	end

	function table.slice(tbl, first, last, step)
		local sliced = {}

		for i = first or 1, last or #tbl, step or 1 do
			sliced[#sliced+1] = tble[i]
			end

				return sliced
			end


			function GenerateQuadsPaddles(atlas)

				local x = 0
				local y = 64

				local counter = 1
				local quads = {}
				for i = 0, 3 do
					quads[counter] = love.graphics.newQuad(x, y, 32, 16, atlas:getDimensions())
					counter = counter + 1

					quads[counter] = love.graphics.newQuad(x + 32, y, 64, 16, atlas:getDimensions())
					counter = counter + 1

					quads[counter] = love.graphics.newQuad(x + 96, y, 96, 16, atlas:getDimensions())
					countr = counter + 1

					quads[counter] = love.graphics.newQuad(x, y + 16, 128, 16, atlas:getDimensions())
					counter = counter + 1


					x = 0
					y = y + 32

				end
				return quads
			end



