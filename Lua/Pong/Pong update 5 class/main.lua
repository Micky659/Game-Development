-- UPDATE 5 The Classes update
-- Added 3 new files
-- A LIBRARY- Class, Two lua classes for Ball and Paddle
-- push.lua still unuseable

Class = require 'class'
require 'Paddle'
require 'Ball'


WINDOW_WIDTH = 432
WINDOW_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
love.graphics.setDefaultFilter('nearest', 'nearest')
math.randomseed(os.time())

smallfont = love.graphics.newFont('font.ttf',8)
love.graphics.setFont(smallfont)

love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
fullscreen = false,
resizable = true,
vsync = true,
})

player1 = Paddle(10, 30, 5, 20)
player2 = Paddle(WINDOW_WIDTH - 10, WINDOW_HEIGHT - 30, 5, 20)

ball = Ball(WINDOW_WIDTH / 2 - 2, WINDOW_HEIGHT / 2 - 2, 4, 4) 


gameState = 'start'
end

function love.update(dt)

	if love.keyboard.isDown('w') then
		player1.dy = -PADDLE_SPEED

		elseif love.keyboard.isDown('s') then
		  player1.dy = PADDLE_SPEED 
		else
			player1.dy = 0
		end

	if love.keyboard.isDown('up') then
		player2.dy = -PADDLE_SPEED

		elseif love.keyboard.isDown('down') then
		  player2.dy = PADDLE_SPEED 
		else
			player2.dy = 0
		end

if gameState == 'play' then
	ball:update(dt)
end

player1:update(dt)
player2:update(dt)
end
	
function love.keypressed(key)
if key == 'i' then
love.event.quit()

elseif key == 'enter' or key == 'return' then
if gameState == 'start' then
   gameState = 'play'
else
	gameState = 'start'

ball:reset()
end
end
end

function love.draw()
love.graphics.clear(40, 45, 53, 255)

	if gameState == 'start' then
	love.graphics.printf("START GAME", 0, 20, WINDOW_WIDTH, 'center')
else
	love.graphics.printf("PLAY", 0, 20, WINDOW_WIDTH, 'center')
end

player1:render() 
player2:render()

ball:render()

end
