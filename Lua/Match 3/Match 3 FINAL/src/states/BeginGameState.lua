BeginGameState = Class{__includes = BaseState}

function BeginGameState:init()

	self.transitionAlpha = 255

	self.board = Board(VIRTUAL_WIDTH - 272, 16)

	self.levelLableY = -64 
end

function BeginGameState:enter(def)

	self.level = def.level

	Timer.tween(1, {
		[self] = {transitionAlpha = 0}
		})

		:finish(function()
			Timer.tween(0.25, {
				[self] = {levelLableY = VIRTUAL_HEIGHT / 2 - 8}
				})

			:finish(function()
				Timer.after(1, function()

					Timer.tween(0.25, {
						[self] = {levelLableY = VIRTUAL_HEIGHT + 30}
						})
					:finish(function()
						gStateMachine:change('play', {
							level = self.level,
							board = self.board
							})
						end)
					end)
				end)
			end)
		end

	function BeginGameState:update(dt)
		Timer.update(dt)
	end

	function BeginGameState:render()

		self.board:render()

		love.graphics.setColor(95, 205, 228, 200)
		love.graphics.rectangle('fill', 0, self.levelLableY - 8, VIRTUAL_WIDTH, 48)
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.setFont(gFonts['large'])
		love.graphics.printf('Level ' .. tostring(self.level), 0, self.levelLableY, VIRTUAL_WIDTH, 'center')

		love.graphics.setColor(255, 255, 255, self.transitionAlpha)
		love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
	end