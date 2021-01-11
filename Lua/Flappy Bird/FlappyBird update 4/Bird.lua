-- the 2's are left and top offsets
-- the 4's are right and bottom offsets
-- both offsets are used to shrink the bounding box
Bird = Class{}

local GRAVITY = 5

function Bird:init()

	self.image = love.graphics.newImage('bird.png')
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

	self.x = WINDOW_WIDTH / 2 - (self.width / 2)
	self.y = WINDOW_HEIGHT / 2 -(self.height / 2)

    self.dy = 0
end

function Bird:collides(pipe)
    if (self.x + 4) + (self.width - 4) >= pipe.x and self.x + 4 <= pipe.x + PIPE_WIDTH then
        if (self.y + 4) + (self.height - 4) >= pipe.y and self.y + 4 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end

    return false
end

function Bird:update(dt)

self.dy = self.dy + GRAVITY * dt

if love.keyboard.wasPressed('j') then
	self.dy = -0.9
end

self.y = self.y + self.dy

end

function Bird:render()
love.graphics.draw(self.image, self.x, self.y)
end

