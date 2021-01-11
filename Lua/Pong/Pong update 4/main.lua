WINDOW_WIDTH = 432
WINDOW_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()

-- smallfont = love.graphics.newFont('font.ttf',8)
love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
fullscreen = false,
resizable = false,
vsync = true,
})

player1Y = 30
player2Y = WINDOW_HEIGHT - 50

ballX = WINDOW_WIDTH / 2 - 2
ballY = WINDOW_HEIGHT / 2 -2

ballDX = math.random(2) == 1 and 100 or -100
ballDY = math.random(-50, 50)

gameState = 'start'
end

function love.update(dt)

	if love.keyboard.isDown('w') then
		player1Y = math.max(0, player1Y + -PADDLE_SPEED * dt)

		elseif love.keyboard.isDown('s') then
		  player1Y = math.min(WINDOW_HEIGHT - 20, player1Y + PADDLE_SPEED * dt)
		end

if love.keyboard.isDown('up') then
		player2Y = math.max(0, player2Y + -PADDLE_SPEED * dt)

		elseif love.keyboard.isDown('down') then
		  player2Y= math.min(WINDOW_HEIGHT - 20, player2Y + PADDLE_SPEED * dt)
		end

if gameState == 'play' then
	ballX = ballX + ballDX * dt
	ballY = ballY + ballDY * dt
end

	
function love.keypressed(key)
if key == 'i' then
love.event.quit()

elseif key == 'enter' or key == 'return' then
if gameState == 'start' then
   gameState = 'play'
else
	gameState = 'start'


ballX = WINDOW_WIDTH / 2 - 2
ballY = WINDOW_HEIGHT / 2 -2

ballDX = math.random(2) == 1 and 100 or -100
ballDY = math.random(-50, 50) * 1.5
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

 
love.graphics.rectangle('fill', 10, player1Y, 5, 20)
love.graphics.rectangle('fill', WINDOW_WIDTH - 10, player2Y, 5, 20)
love.graphics.circle('fill', ballX, ballY, 4, 4) 
end
end