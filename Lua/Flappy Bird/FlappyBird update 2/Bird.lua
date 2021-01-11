-- Applied gravity to the bird
-- Applied jump
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

function Bird:update(dt)

self.dy = self.dy + GRAVITY * dt

if love.keyboard.wasPressed('j') then
	self.dy = -1
end

self.y = self.y + self.dy

end

function Bird:render()
love.graphics.draw(self.image, self.x, self.y)
end

