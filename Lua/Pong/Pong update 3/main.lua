WINDOW_WIDTH = 432
WINDOW_HEIGHT = 243

function love.load()

-- smallfont = love.graphics.newFont('font.ttf',8)
love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
fullscreen = false,
resizable = false,
vsync = true,
})
end

function love.keypressed(key)
if key == 'i' then
love.event.quit()
end
end

function love.draw()
love.graphics.printf("Hello Pong", 0, 20, WINDOW_WIDTH, 'center')
love.graphics.rectangle('fill', 10, 30, 5, 20)
love.graphics.rectangle('fill', WINDOW_WIDTH - 10, WINDOW_HEIGHT - 50, 5, 20)
love.graphics.circle('fill', WINDOW_WIDTH/2 - 2, WINDOW_HEIGHT/2 - 2, 4, 4)
end