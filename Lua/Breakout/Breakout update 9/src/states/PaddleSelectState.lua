-- Variables and game objects are initialized here
-- variable highscore is linked with startstate 
PaddleSelectState = Class{__includes = BaseState}

function PaddleSelectState:enter(params)
	self.highScores = params.highScores
end

function PaddleSelectState:init()
	self.currentPaddle = 1
	self.rewardScore = 6000
end

function PaddleSelectState:update(dt)
	if love.keyboard.wasPressed('left') then
		if self.currentPaddle == 1 then
			gSounds['no-select']:play()
		else
			gSounds['select']:play()
			self.currentPaddle = self.currentPaddle - 1
		end

			elseif love.keyboard.wasPressed('right') then
		if self.currentPaddle == 4 then
			gSounds['no-select']:play()
		else
			gSounds['select']:play()
			self.currentPaddle = self.currentPaddle + 1
		end
	end
 
		 if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		 	gSounds['confirm']:play()

		 	      gStateMachine:change('serve', {
                paddle = Paddle(self.currentPaddle),
                bricks = LevelMaker.createMap(1),
                health = 3,
                score = 0,
                highScores = self.highScores,
                level = 1,
                rewardScore = self.rewardScore   
                })
		 	  end

		 	  if love.keyboard.wasPressed('i') then
		 	  	love.event.quit()
		 	  end
		 	end

		 	function PaddleSelectState:render()
		 	love.graphics.setFont(gFonts['medium'])
		 	love.graphics.printf("Select your paddle with left or right!!", 0, WINDOW_HEIGHT / 4, WINDOW_WIDTH, 'center')
		 	love.graphics.setFont(gFonts['small'])
		 	love.graphics.printf("Press Enter to continue!!", 0, WINDOW_HEIGHT / 3, WINDOW_WIDTH, 'center')

		 		 		love.graphics.setColor(255, 255, 255, 255)

		 	if self.currentPaddle == 1 then

		 		love.graphics.setColor(40, 40, 40, 128)
		 	end

		 	love.graphics.draw(gTextures['arrows'], gFrames['arrows'][1], WINDOW_WIDTH / 4 - 24, WINDOW_HEIGHT - WINDOW_HEIGHT / 3)

		 	love.graphics.setColor(255, 255, 255, 255)

		 			 	if self.currentPaddle == 4 then

		 		love.graphics.setColor(40, 40, 40, 128)
		 	end

		 	love.graphics.draw(gTextures['arrows'], gFrames['arrows'][2], WINDOW_WIDTH / 4 + 216, WINDOW_HEIGHT - WINDOW_HEIGHT / 3)

		 	love.graphics.setColor(255, 255, 255, 255)

		 	love.graphics.draw(gTextures['main'], gFrames['paddles'][2 + 4 * (self.currentPaddle - 1)], WINDOW_WIDTH / 2 - 32, WINDOW_HEIGHT - WINDOW_HEIGHT / 3 + 5.5)
		 end
