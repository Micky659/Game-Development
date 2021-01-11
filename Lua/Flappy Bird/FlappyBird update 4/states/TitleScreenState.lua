TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)
if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
gStateMachine:change('play')
end
end

function TitleScreenState:render()
love.graphics.setFont(flappyFont)
love.graphics.printf('Flappy Bird', 0, 64, WINDOW_WIDTH, 'center')

love.graphics.setFont(mediumFont)
love.graphics.printf('Made by Micky659', 30, 93, WINDOW_WIDTH, 'center')
love.graphics.printf('Press Enter', 0, 200, WINDOW_WIDTH, 'center')
end