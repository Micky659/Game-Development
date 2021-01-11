-- Pipe is set with random y value 
-- pipe scroll is unit pipe speed which is same as speed of ground

Pipe = Class{}

local PIPE_IMAGE = love.graphics.newImage('pipe.png')

local PIPE_SCROLL = -60

function Pipe:init()

	self.x = WINDOW_WIDTH

	self.y = math.random(WINDOW_HEIGHT / 4, WINDOW_HEIGHT - 16)

	self.width = PIPE_IMAGE:getWidth()
end

function Pipe:update(dt)

self.x = self.x + PIPE_SCROLL * dt 

end

function Pipe:render()

love.graphics.draw(PIPE_IMAGE, math.floor(self.x + 0.5), math.floor(self.y))

end
