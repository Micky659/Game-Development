-- FlappyBird update 2 Pipe
-- image inserted for pipe
-- made a new keypressed function and table for single key input
Class = require 'class'

require 'Bird'
require 'Pipe'

WINDOW_WIDTH = 512
WINDOW_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local  BACKGROUND_LOOPING_POINT = 413

local bird = Bird()

local pipes = {}

local spwanTimer = 0

function love.load()
	 love.graphics.setDefaultFilter('nearest', 'nearest')
     love.window.setTitle('Flappy Bird')

	 love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {

	 fullscreen = false,
	 resizable = true,
	 vsync = true
	 	})
	end
love.keyboard.keysPressed = {}

	 function love.keypressed(key)

love.keyboard.keysPressed[key] = true 

	 	if key == 'i' then
	 		love.event.quit()
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
	 	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) 
	 	                       % BACKGROUND_LOOPING_POINT

	 	groundScroll = ( groundScroll + GROUND_SCROLL_SPEED * dt )
                            % WINDOW_WIDTH

                            spwanTimer = spwanTimer + dt 

                            if spwanTimer > 2 then
                            	table.insert(pipes, Pipe())
                            	print('NEW PIPE ADDED')
                            	spwanTimer = 0
                            end

                        
             bird:update(dt)

        for k, pipe in pairs(pipes) do
        	pipe:update(dt)

if pipe.x < -pipe.width then
	table.remove(pipes, k)
end
end

             love.keyboard.keysPressed = {}
                       end

	 	function love.draw()

	 		love.graphics.draw(background, -backgroundScroll, 0)
                
            for k, pipe in pairs(pipes) do
            	pipe:render()
            end

	 		love.graphics.draw(ground, -groundScroll, WINDOW_HEIGHT - 16)
	 	
           bird:render()
	 	end