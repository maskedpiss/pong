Globals = {}
Globals.Arena = nil
Globals.Paddle = nil

function love.load()
  Globals.Arena = require("src/objs/arena")
  Globals.Arena:load()
  
  Globals.Paddle = require("src/objs/paddle")
  Globals.Paddle:load()
end


function love.update(dt)
  Globals.Paddle:update(dt)
end


function love.draw()
  Globals.Arena:draw()
  Globals.Paddle:draw()
end
