--Variable is linked with playstate

GameOverState = Class{__includes = BaseState}

function GameOverState:enter(params)
	self.score = params.score
end

function GameOverState:update(dt)

	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		gStateMachine:change('start')
	end

	if love.keyboard.wasPressed('i') then
		love.event.quit()
	end
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('GAME OVER', 0, WINDOW_HEIGHT / 3, WINDOW_WIDTH, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Final Score: ' .. tostring(self.score), 0, WINDOW_HEIGHT / 2,
        WINDOW_WIDTH, 'center')
    love.graphics.printf('Press Enter!', 0, WINDOW_HEIGHT - WINDOW_HEIGHT / 4,
        WINDOW_WIDTH, 'center')
end

