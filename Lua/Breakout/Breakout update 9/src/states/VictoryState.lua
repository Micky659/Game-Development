-- Variables are linked with playstate 

VictoryState = Class{__includes = BaseState}

function VictoryState:enter(params)
    self.level = params.level
    self.score = params.score
    self.paddle = params.paddle
    self.health = params.health
    self.ball = params.ball
    self.rewardScore = params.rewardScore
end

function VictoryState:update(dt)
    self.paddle:update(dt)

    self.ball.x = self.paddle.x + (self.paddle.width / 2) - 4
    self.ball.y = self.paddle.y - 8

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('serve', {
            level = self.level + 1,
            bricks = LevelMaker.createMap(self.level + 1),
            paddle = self.paddle,
            health = self.health,
            score = self.score,
            rewardScore = self.rewardScore
        })
    end
end

function VictoryState:render()
   love.graphics.setColor(255, 255, 255, 255)
    self.paddle:render()
    self.ball:render()

    renderHealth(self.health)
    renderScore(self.score)

    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("Level " .. tostring(self.level) .. " complete!",
        0, WINDOW_HEIGHT / 4, WINDOW_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter to serve!', 0, WINDOW_HEIGHT / 2,
        WINDOW_WIDTH, 'center')
end