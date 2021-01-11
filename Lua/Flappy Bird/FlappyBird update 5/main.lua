-- FlappyBird update 4 	Countdown 
-- Countdown state is added so before play state a countdown executes
Class = require 'class'

require 'Bird'
require 'Pipe'
require 'PipePair'

require 'StateMachine'
require 'states/BaseState'
require 'states/PlayState'
require 'states/TitleScreenState'
require 'states/ScoreState'
require 'states/CountdownState'

WINDOW_WIDTH = 512
WINDOW_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local  BACKGROUND_LOOPING_POINT = 413

scrolling = true

function love.load()
	 love.graphics.setDefaultFilter('nearest', 'nearest')
     love.window.setTitle('Flappy Bird')

     smallFont = love.graphics.newFont('font.ttf', 8)
    mediumFont = love.graphics.newFont('flappy.ttf', 14)
    flappyFont = love.graphics.newFont('flappy.ttf', 28)
    hugeFont = love.graphics.newFont('flappy.ttf', 56)
    love.graphics.setFont(flappyFont)

	 love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {

	 fullscreen = false,
	 resizable = true,
	 vsync = true
	 	})

     gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end,
        ['count'] = function() return CountdownState() end,
    }
    gStateMachine:change('title')

love.keyboard.keysPressed = {}

end

	 function love.keypressed(key)

love.keyboard.keysPressed[key] = true 

	 	if key == 'i' then
	 		love.event.quit()

	elseif scrolling and  key == 'p' then
		scrolling = false 
		else scrolling = true

end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
  	 end

	 function love.update(dt)

    if scrolling then

	 	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) 
	 	                       % BACKGROUND_LOOPING_POINT

	 	groundScroll = ( groundScroll + GROUND_SCROLL_SPEED * dt )
                            % WINDOW_WIDTH 
          gStateMachine:update(dt)

               love.keyboard.keysPressed = {}
end
end

	 	function love.draw()

	 		love.graphics.draw(background, -backgroundScroll, 0)
                
           gStateMachine:render()

	 		love.graphics.draw(ground, -groundScroll, WINDOW_HEIGHT - 16)
	 	
        
	 	end