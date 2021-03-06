PlayState = Class{__includes = BaseState}

PIPE_SPEED = 60
PIPE_WIDTH = 70
PIPE_HEIGHT = 288

BIRD_WIDTH = 38
BIRD_HEIGHT = 24

function PlayState:init()
self.bird = Bird()
self.pipePairs = {}

self.timer = 0

self.spwan = 2

self.score = 0

self.lastY = -PIPE_HEIGHT + math.random(80) + 20
end

function PlayState:update(dt)
                          
                         self.timer = self.timer + dt

                            if self.timer > self.spwan then

                            	
                            	local y = math.max(-PIPE_HEIGHT + 10,
                            		math.min(self.lastY + math.random(-20, 20), WINDOW_HEIGHT - 90 - PIPE_HEIGHT))
                            	self.lastY = y
                            	
                            	table.insert(self.pipePairs, PipePair(y))
                            	self.timer = 0
                              self.spwan = math.random(2, 4)
                            end

                
        for k, pair in pairs(self.pipePairs) do

           if not pair.scored then
            if pair.x + PIPE_WIDTH < self.bird.x then
              self.score = self.score + 1
              PIPE_SPEED = PIPE_SPEED + 1
              pair.scored = true
            end
          end

        	pair:update(dt)
        end


    -- we need this second loop, rather than deleting in the previous loop, because
    -- modifying the table in-place without explicit keys will result in skipping the
    -- next pipe, since all implicit keys (numerical indices) are automatically shifted
    -- down after a table removal


          for k, pair in pairs(self.pipePairs) do
        if pair.remove then
        	table.remove(self.pipePairs, k)
        end
    end

             self.bird:update(dt)
            
            for k, pair in pairs(self.pipePairs) do
           for l, pipe in pairs(pair.pipes) do
                if self.bird:collides(pipe) then
                    gStateMachine:change('score', {
                      score = self.score
                      })     
        end
      end
  end

      if self.bird.y > WINDOW_HEIGHT - 15 then
      	gStateMachine:change('score', {
          score = self.score
          })
end


  end

function PlayState:render()
for k, pair in pairs(self.pipePairs) do
	pair:render()
end

love.graphics.setFont(flappyFont)
love.graphics.print('score: ' ..tostring(self.score), 8, 8)

self.bird:render()
end