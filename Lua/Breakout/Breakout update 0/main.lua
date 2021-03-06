-- Update 0 option screen
-- Made file management easier

require 'src/Dependencies'

function love.load()

love.graphics.setDefaultFilter('nearest', 'nearest')

math.randomseed(os.time())

love.window.setTitle('Breakout')

gFonts = {
['small'] = love.graphics.newFont('fonts/font.ttf', 8),
['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
['selectmedium'] = love.graphics.newFont('fonts/font.ttf', 20), 
['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}
love.graphics.setFont(gFonts['small'])

gTextures = {
	['background'] = love.graphics.newImage('graphics/background.png'), 
	['main'] = love.graphics.newImage('graphics/breakout.png'),
	['arrows'] = love.graphics.newImage('graphics/arrows.png'),
	['hearts'] = love.graphics.newImage('graphics/hearts.png'),
	['particle'] = love.graphics.newImage('graphics/particle.png')
}

love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
	fullscreen = false,
	resizable = true,
	vsync = true
})

gSounds = {
        ['paddle-hit'] = love.audio.newSource('sounds/paddle_hit.wav'),
        ['score'] = love.audio.newSource('sounds/score.wav'),
        ['wall-hit'] = love.audio.newSource('sounds/wall_hit.wav'),
        ['confirm'] = love.audio.newSource('sounds/confirm.wav'),
        ['select'] = love.audio.newSource('sounds/select.wav'),
        ['no-select'] = love.audio.newSource('sounds/no-select.wav'),
        ['brick-hit-1'] = love.audio.newSource('sounds/brick-hit-1.wav'),
        ['brick-hit-2'] = love.audio.newSource('sounds/brick-hit-2.wav'),
        ['hurt'] = love.audio.newSource('sounds/hurt.wav'),
        ['victory'] = love.audio.newSource('sounds/victory.wav'),
        ['recover'] = love.audio.newSource('sounds/recover.wav'),
        ['high-score'] = love.audio.newSource('sounds/high_score.wav'),
        ['pause'] = love.audio.newSource('sounds/pause.wav'),

        ['music'] = love.audio.newSource('sounds/music.wav')
    }


    -- our current game state can be any of the following:
    -- 1. 'start' (the beginning of the game, where we're told to press Enter)
    -- 2. 'paddle-select' (where we get to choose the color of our paddle)
    -- 3. 'serve' (waiting on a key press to serve the ball)
    -- 4. 'play' (the ball is in play, bouncing between paddles)
    -- 5. 'victory' (the current level is over, with a victory jingle)
    -- 6. 'game-over' (the player has lost; display score and allow restart)

gStateMachine = StateMachine {
        ['start'] = function() return StartState() end
    }
    gStateMachine:change('start')

love.keyboard.keysPressed = {}

end


function love:update(dt)

gStateMachine:update(dt)

love.keyboard.keysPressed = {}

end


function love.keypressed(key)
love.keyboard.keysPressed[key] = true
end


function love.keyboard.wasPressed(key)
 if love.keyboard.keysPressed[key] then
return true
else
return false
end 
end

function love.draw()

local backgroundWidth = gTextures['background']:getWidth()
local backgroundHeight = gTextures['background']:getHeight()

love.graphics.draw(gTextures['background'],
0, 0,
0,
WINDOW_WIDTH / (backgroundWidth - 1), WINDOW_HEIGHT / (backgroundHeight - 1))

gStateMachine:render()

displayFPS()
end

function displayFPS()
love.graphics.setFont(gFonts['small'])
love.graphics.setColor(0, 255, 0, 255)
love.graphics.print('FPS : ' ..tostring(love.timer.getFPS()), 5, 5)
end
