ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
self.score = params.score
end

function ScoreState:update(dt)
if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
gStateMachine:change('title')
end
end

function ScoreState:render()

love.graphics.setFont(flappyFont)
love.graphics.printf('Damn bruh yo lost', 0, 64, WINDOW_WIDTH, 'center')

love.graphics.setFont(mediumFont)
love.graphics.printf('Your Score is ' ..tostring(self.score), 0, 100, WINDOW_WIDTH, 'center')

love.graphics.printf('Press Enter to lose again...NOOB', 0, 160, WINDOW_WIDTH, 'center')
end
