-- FlappyBird update 3 PipePair
-- pipe pairs are added
-- game is paused if collison is detected
Class = require 'class'

require 'Bird'
require 'Pipe'
require 'PipePair'

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

local pipePairs = {}

local spwanTimer = 0

local lastY = -PIPE_HEIGHT + math.random(80) + 20

local scrolling = true

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

    if scrolling then

	 	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) 
	 	                       % BACKGROUND_LOOPING_POINT

	 	groundScroll = ( groundScroll + GROUND_SCROLL_SPEED * dt )
                            % WINDOW_WIDTH

                            spwanTimer = spwanTimer + dt 

                            if spwanTimer > 2 then

                            	
                            	local y = math.max(-PIPE_HEIGHT + 10,
                            		math.min(lastY + math.random(-20, 20), WINDOW_HEIGHT - 90 - PIPE_HEIGHT))
                            	lastY = y
                            	
                            	table.insert(pipePairs, PipePair(y))
                            	spwanTimer = 0
                            end

                        
             bird:update(dt)

        for k, pair in pairs(pipePairs) do
        	pair:update(dt)

           for l, pipe in pairs(pair.pipes) do
                if bird:collides(pipe) then
                    scrolling = false
                end
        end




      end

for k, pair in pairs(pipePairs) do
        if pair.remove then
        	table.remove(pipePairs, k)
        end
    end
  end


             love.keyboard.keysPressed = {}
                       end

	 	function love.draw()

	 		love.graphics.draw(background, -backgroundScroll, 0)
                
            for k, pair in pairs(pipePairs) do
            	pair:render()
            end

	 		love.graphics.draw(ground, -groundScroll, WINDOW_HEIGHT - 16)
	 	
           bird:render()
	 	end