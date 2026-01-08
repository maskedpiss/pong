Globals = {}
Globals.Arena = nil
Globals.Paddle = nil
Globals.Ball = nil

function love.load()
  Globals.Arena = require("src/objs/arena")
  Globals.Arena:load()
  
  Globals.Paddle = require("src/objs/paddle")
  Globals.Paddle:load()
  
  Globals.Ball = require("src/objs/ball")
  Globals.Ball:load()
end


function love.update(dt)
  Globals.Paddle:update(dt)
  Globals.Ball:update(dt)
end


function love.draw()
  Globals.Arena:draw()
  Globals.Paddle:draw()
  Globals.Ball:draw()
end
