Class = require 'lib/class'

-- push = require 'lib/push'

Timer = require 'lib/knife.timer'


require 'src/StateMachine'
require 'src/Util'

require 'src/Board'
require 'src/Tile'

require 'src/states/BaseState'
require 'src/states/BeginGameState'
require 'src/states/GameOverState'
require 'src/states/StartState'
require 'src/states/PlayState'

gSounds = {
	['music'] = love.audio.newSource('sounds/music3.mp3'),
	['select'] = love.audio.newSource('sounds/select.wav'),
	['error'] = love.audio.newSource('sounds/error.wav'),
	['match'] = love.audio.newSource('sounds/match.wav'),
	['clock'] = love.audio.newSource('sounds/clock.wav'),
	['game-over'] = love.audio.newSource('sounds/game-over.wav'),
	['next-level'] = love.audio.newSource('sounds/next-level.wav')
}

gTextures = {
	['main'] = love.graphics.newImage('graphics/match3.png'),
	['background'] = love.graphics.newImage('graphics/background.png')
}

gFrames = {
	['tiles'] = GenerateTileQuads(gTextures['main'])
}

gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32)
}