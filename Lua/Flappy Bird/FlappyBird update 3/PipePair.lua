-- using pipe class a table fo two mirror pipes is build
-- y is a variable for upper pipe location
-- Note - Avoid deleting data from a table which is iterating and that is why self.remove is used
-- pipe class is passing a string i.e. orientation 
PipePair = Class{}

local GAP_HEIGHT = 90
local PIPE_SPEED = 60

function PipePair:init(y)

	self.x = WINDOW_WIDTH + 32

    self.y = y

    self.pipes = {
    ['upper'] = Pipe('top', self.y),
    ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
}

self.remove = false 
	end


function PipePair:update(dt)

	if self.x > -PIPE_WIDTH then
		self.x = self.x - PIPE_SPEED * dt
		self.pipes['lower'].x = self.x
		self.pipes['upper'].x = self.x
	else
		self.remove = true 
	end
end

function PipePair:render()
for k, pipe in pairs(self.pipes) do
	pipe:render()
end
end


