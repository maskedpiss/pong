Globals = {}
Globals.Arena = nil

function love.load()
  Globals.Arena = require("src/objs/arena")
  Globals.Arena:load()
end


function love.update(dt)
  
end


function love.draw()
  Globals.Arena:draw()
end
