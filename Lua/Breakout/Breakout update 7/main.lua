-- update 7 Victory update

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

    gFrames = {
        ['paddles'] = GenerateQuadsPaddles(gTextures['main']),
        ['balls'] = GenerateQuadsBalls(gTextures['main']),
        ['bricks'] = GenerateQuadsBricks(gTextures['main']),
        ['hearts'] = GenerateQuads(gTextures['hearts'], 10, 9)
    }
    

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
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


    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['serve'] = function() return ServeState() end,
        ['game-over'] = function() return GameOverState() end,
        ['victory'] = function() return VictoryState() end
    }
    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end

function love.update(dt)
    
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
        WINDOW_WIDTH / (backgroundWidth - 1),  WINDOW_HEIGHT / (backgroundHeight - 1))
    
   
    gStateMachine:render()
    
    displayFPS()
    
   
end

function renderHealth(health)
local healthX = WINDOW_WIDTH - 100

for i = 1, health do
    love.graphics.draw(gTextures['hearts'], gFrames['hearts'][1], healthX, 4)
    healthX = healthX + 11
end

for i = 1, 3 - health do
    love.graphics.draw(gTextures['hearts'], gFrames['hearts'][2], healthX, 4)
    healthX = healthX + 11
end
end


function displayFPS()
  
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end

function renderScore(score)
love.graphics.setFont(gFonts['small'])
love.graphics.print('score: ', WINDOW_WIDTH - 60, 5)
love.graphics.printf(tostring(score), WINDOW_WIDTH - 50, 5, 40, 'right')
end             