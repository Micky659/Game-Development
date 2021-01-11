-- FlappyBird update 0 background
-- image inserted for background
-- background is looped to create a infinite level illusion

WINDOW_WIDTH = 530
WINDOW_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 80

local  BACKGROUND_LOOPING_POINT = 413

function love.load()
	 love.graphics.setDefaultFilter('nearest', 'nearest')
     love.window.setTitle('Flappy Bird')

	 love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {

	 fullscreen = false,
	 resizable = false,
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
                       end

	 	function love.draw()

	 		love.graphics.draw(background, -backgroundScroll, 0)

	 		love.graphics.draw(ground, -groundScroll, WINDOW_HEIGHT - 16)
	 	end