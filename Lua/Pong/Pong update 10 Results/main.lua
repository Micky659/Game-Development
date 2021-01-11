-- UPDATE 10 Victory 
-- Display Player victroy text and switch next game serving player
-- Added sound
-- push.lua still unuseable

Class = require 'class'
require 'Paddle'
require 'Ball'


WINDOW_WIDTH = 432
WINDOW_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
love.graphics.setDefaultFilter('nearest', 'nearest')

love.window.setTitle('Pong')
math.randomseed(os.time())

smallFont = love.graphics.newFont('font.ttf',10)
scoreFont = love.graphics.newFont('font.ttf',32)
largeFont = love.graphics.newFont('font.ttf', 16)

love.graphics.setFont(smallFont)

sounds = {
	['paddle_hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
	['score'] = love.audio.newSource('sounds/score.wav', 'static'),
	['wall_hit'] = love.audio.newSource('sounds/wall_hit.wav', 'static')
}

love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
fullscreen = false,
resizable = true,
vsync = true,
})

player1Score = 0
player2Score = 0

servingPlayer = 1

player1 = Paddle(10, 30, 5, 20)
player2 = Paddle(WINDOW_WIDTH - 10, WINDOW_HEIGHT - 30, 5, 20)

ball = Ball(WINDOW_WIDTH / 2 - 2, WINDOW_HEIGHT / 2 - 2, 4, 4) 


gameState = 'start'
end

function love.update(dt)

if gameState == 'serve' then 
	ball.dy = math.random(-50, 50)
	if servingPlayer == 2 then
		ball.dx = math.random(140, 200)
	else
		ball.dx = -math.random(140, 200)
	end

elseif gameState == 'play' then
	if ball:collides(player1) then
		ball.dx = -ball.dx * 1.23
		ball.x = player1.x + 5

		if ball.dy < 0 then
			ball.dy = -math.random(10, 150)
		else
			ball.dy = math.random(10, 150)
		end
	end

	if ball:collides(player2) then
		   ball.dx = -ball.dx * 1.23
            ball.x = player2.x - 4

            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end

	if ball.y <= 0 then
		ball.y = 0
		ball.dy = -ball.dy 
	end

	if ball.y >= WINDOW_HEIGHT - 4 then
		ball.y = WINDOW_HEIGHT - 4
		ball.dy = -ball.dy
	end

if ball.x + 4 < 0 then
servingPlayer = 2
	player2Score = player2Score + 1

if player2Score == 5 then
	winningPlayer = 2
	gameState = 'Done'
else
	gameState = 'serve'
	ball:reset()
end
end


if ball.x > WINDOW_WIDTH then
            servingPlayer = 1
            player1Score = player1Score + 1
            
            if player1Score == 5 then
                winningPlayer = 1
                gameState = 'Done'
            else
                gameState = 'serve'
                ball:reset()
            end
        end
    end



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
   gameState = 'serve'
elseif gameState == 'serve' then
	gameState = 'play'
	elseif gameState == 'Done' then

		gameState = 'serve'

ball:reset()

player1Score = 0
player2Score = 0

if winningPlayer == 1 then
                servingPlayer = 1
            else
                servingPlayer = 2
            end
        end
    end
end

function love.draw()
love.graphics.clear(40, 45, 52, 255)
love.graphics.setFont(largeFont)
love.graphics.printf('Made by Micky659', 0, WINDOW_HEIGHT - 20, WINDOW_WIDTH, 'center')
	if gameState == 'start' then
		love.graphics.setFont(smallFont)
	love.graphics.printf('PONG', 0, 10, WINDOW_WIDTH, 'center')
	love.graphics.printf('Press enter to play', 0, 20, WINDOW_WIDTH, 'center')
elseif gameState == 'serve' then 
	love.graphics.setFont(smallFont) 
	love.graphics.printf('Player '..tostring(servingPlayer).. "'s serve", 0, 10, WINDOW_WIDTH, 'center')
    love.graphics.printf('Press enter to serve', 0, 20, WINDOW_WIDTH, 'center')
    elseif gameState == 'play' then

    	elseif gameState == 'Done' then
    		love.graphics.setFont(largeFont)
    		love.graphics.printf('Player ' ..tostring(winningPlayer).. ' Won the game', 0, 10, WINDOW_WIDTH, 'center')
    		love.graphics.setFont(smallFont)
    		love.graphics.printf('Press Enter to Restart the game', 0, 30, WINDOW_WIDTH, 'center')
end

love.graphics.setFont(scoreFont)
love.graphics.print(tostring(player1Score), WINDOW_WIDTH / 2 - 40, WINDOW_HEIGHT / 3)
love.graphics.print(tostring(player2Score), WINDOW_WIDTH / 2 + 30, WINDOW_HEIGHT / 3)

player1:render() 
player2:render()

ball:render()

displayFPS()
end

function displayFPS()
	love.graphics.setFont(smallFont)
	love.graphics.setColor(0, 255, 0, 255)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end