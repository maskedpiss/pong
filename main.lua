Globals = {}
Globals.Arena = nil
Globals.Paddle = nil
Globals.Ball = nil
Globals.Collisions = require("src/utils/collisions")

playerOne = nil

function love.load()
  Globals.Arena = require("src/objs/arena")
  Globals.Arena:load()
  
  Globals.Paddle = require("src/objs/paddle")
  playerOne = Globals.Paddle.new(50, love.graphics.getHeight() / 2)
  playerTwo = Globals.Paddle.new(love.graphics.getWidth() - 70, love.graphics.getHeight() / 2)
  
  Globals.Ball = require("src/objs/ball")
  gameBall = Globals.Ball.new()
end


function love.update(dt)
  playerOne:update(dt)
  playerTwo:update(dt)
  gameBall:update(dt)
end


function love.draw()
  Globals.Arena:draw()
  playerOne:draw()
  playerTwo:draw()
  gameBall:draw()
end
