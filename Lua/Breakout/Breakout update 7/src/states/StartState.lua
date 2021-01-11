-- Variables and game objects are initialized here

StartState = Class{__includes = BaseState}


local highlighted = 1

function StartState:update(dt)
   
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
        gSounds['paddle-hit']:play()
    end

  
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gSounds['confirm']:play()

        if highlighted == 1 then
            gStateMachine:change('serve', {
                paddle = Paddle(1),
                bricks = LevelMaker.createMap(1),
                health = 3,
                score = 0,
                level = 1   
                })
        end
    end
    if love.keyboard.wasPressed('i') then
        love.event.quit()
    end
end

function StartState:render()

love.graphics.setFont(gFonts['large'])
love.graphics.setColor(255, 0, 0, 255)
love.graphics.printf('Breakout', 0, WINDOW_HEIGHT / 3, WINDOW_WIDTH, 'center')

love.graphics.setFont(gFonts['small'])
love.graphics.printf('made by micky659', 0, WINDOW_HEIGHT / 3 + 30, WINDOW_WIDTH + 40, 'center')
love.graphics.setFont(gFonts['medium'])
love.graphics.setColor(255, 255, 255, 255)

if highlighted == 1 then

love.graphics.setFont(gFonts['selectmedium'])
love.graphics.setColor(103, 255, 255, 255)
end

love.graphics.printf('START', 0, WINDOW_HEIGHT / 2 + 70, WINDOW_WIDTH, 'center')
love.graphics.setColor(255, 255, 255, 255)

love.graphics.setFont(gFonts['medium'])

if highlighted == 2 then
love.graphics.setFont(gFonts['selectmedium'])
love.graphics.setColor(103, 255, 255, 255)
end

love.graphics.printf('HIGH SCORE', 0, WINDOW_HEIGHT / 2 + 90, WINDOW_WIDTH, 'center')
love.graphics.setColor(255, 255, 255, 255)
end