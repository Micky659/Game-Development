-- Paddle movement and pause function added
PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.paddle = Paddle()
end

function PlayState:update(dt)
    if self.paused then
        if love.keyboard.wasPressed('p') then
            self.paused = false
            gSounds['pause']:play()
        else
            return
        end
    elseif love.keyboard.wasPressed('p') then
        self.paused = true
        gSounds['pause']:play()
        return
    end


    self.paddle:update(dt)

    if love.keyboard.wasPressed('i') then
        love.event.quit()
    end
end

function PlayState:render()
    self.paddle:render()

 
    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, WINDOW_HEIGHT / 2 - 16, WINDOW_WIDTH, 'center')
    end
end