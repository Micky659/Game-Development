-- Variable highscores is linked with startstate

HighScoreState = Class{__includes = BaseState}

function HighScoreState:enter(params)
	self.highScores = params.highScores
end

function HighScoreState:update(dt)
	if love.keyboard.wasPressed('i') then
		gSounds['wall-hit']:play()

		gStateMachine:change('start', {
			highScores = self.highScores
			})
	end
end

	function HighScoreState:render()
		love.graphics.setFont(gFonts['large'])
		love.graphics.printf('High Scores', 0, 20, WINDOW_WIDTH, 'center')

		love.graphics.setFont(gFonts['medium'])


 for i = 1, 10 do
        local name = self.highScores[i].name or '---'
        local score = self.highScores[i].score or '---'

			love.graphics.printf(tostring(i) .. '.', WINDOW_WIDTH / 4, 60 + i * 13, 50, 'left')

			love.graphics.printf(name, WINDOW_WIDTH / 4 + 38, 60 + i * 13, 50, 'right')

			love.graphics.printf(tostring(score), WINDOW_WIDTH / 2, 60 + i * 13, 100, 'right')

		end

			love.graphics.setFont(gFonts['small'])
			love.graphics.printf("Press i to return to the main menu!", 0, WINDOW_HEIGHT - 18, WINDOW_WIDTH, 'center')
	end
