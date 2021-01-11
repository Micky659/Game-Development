-- FlappyBird update 1 bird
-- image inserted for bird
Class = require 'class'

require 'Bird'

WINDOW_WIDTH = 512
WINDOW_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 0

local  BACKGROUND_LOOPING_POINT = 413

local bird = Bird()

function love.load()
	 love.graphics.setDefaultFilter('nearest', 'nearest')
     love.window.setTitle('Flappy Bird')

	 love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {

	 fullscreen = false,
	 resizable = true,
	 vsync = true
	 	})
	end

	 function love.keypressed(key)
	 	if key == 'i' then
	 		love.event.quit()
	 	end
         
         if key == 'b' then
      love.graphics.draw(background, backgroundScroll, 0)

	 		love.graphics.draw(ground, groundScroll, WINDOW_HEIGHT - 16)
	 	end
	 end

	 function love.update(dt)
	 	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) 
	 	                       % BACKGROUND_LOOPING_POINT

	 	groundScroll = ( groundScroll + GROUND_SCROLL_SPEED * dt )
                            % WINDOW_WIDTH
                        
             bird:update(dt)
                       end

	 	function love.draw()

            		

	 		love.graphics.draw(background, -backgroundScroll, 0)

	 		love.graphics.draw(ground, -groundScroll, WINDOW_HEIGHT - 16)
	 	
           bird:render()
	 	end