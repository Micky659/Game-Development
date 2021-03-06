-- Paddle movement and pause function added
-- update to improve brick and paddle collision for all four sides
PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.paddle = Paddle()
    self.ball = Ball(math.random(7))

    self.ball.dx = math.random(-200, 200)
    self.ball.dy = math.random(-50, -60)

    self.ball.x = WINDOW_WIDTH / 2 - 4
    self.ball.y = WINDOW_HEIGHT - 42

    self.bricks = LevelMaker.createMap()
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
    self.ball:update(dt)

    if self.ball:collides(self.paddle) then
        self.ball.y = self.paddle.y - 8
        self.ball.dy = -self.ball.dy

        if self.ball.x < self.paddle.x + (self.paddle.width / 2) and self.paddle.dx < 0 then
        self.ball.dx = -50 + -(8 * (self.paddle.x + self.paddle.width / 2 - self.ball.x))

        elseif self.ball.x > self.paddle.x + (self.paddle.width / 2) and self.paddle.dx > 0 then
        self.ball.dx = 50 + (8 * math.abs(self.paddle.x + self.paddle.width / 2 - self.ball.x)) 
    end


        gSounds['paddle-hit']:play()
    end

    for k, brick in pairs (self.bricks) do
        if brick.inPlay and self.ball:collides(brick) then
            brick:hit()
            


            if self.ball.x + 2 < brick.x and  self.ball.dx > 0 then
                self.ball.dx = -self.ball.dx
                self.ball.x = brick.x - 8

                elseif self.ball.x + 6 > brick.x + brick.width and self.ball.dx < 0 then
                    self.ball.dx = -self.ball.dx
                    self.ball.x = brick.x + 32

                    elseif self.ball.y < brick.y then
                        self.ball.dy = -self.ball.dy
                        self.ball.y = brick.y - 8

                    else
                        self.ball.dy = -self.ball.dy
                        self.ball.y = brick.y + 16
                        end     

                        self.ball.dy = self.ball.dy * 1.02
                        break
                    end
                end


    if love.keyboard.wasPressed('i') then
        love.event.quit()
    end
end

function PlayState:render()
    self.paddle:render()
    self.ball:render()

for k, brick in pairs(self.bricks) do
    brick:render()
end
 
    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, WINDOW_HEIGHT / 2 - 16, WINDOW_WIDTH, 'center')
    end
end