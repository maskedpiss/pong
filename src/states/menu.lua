local Menu = {}

local playButton = nil
local exitButton = nil

function Menu.onEnter()
  Menu.Title = {
      font = love.graphics.newFont(128),
      text = "Pong"
  }
  
  Globals.Button = require("src/objs/button")
  playButton = Globals.Button.new("Play", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
  exitButton = Globals.Button.new("Exit", love.graphics.getWidth() / 2, (love.graphics.getHeight() / 2) + 100)
end


function Menu.update(dt)
  
end


function Menu.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, 0, 100, love.graphics.getWidth(), "center")
  
  playButton:draw()
  exitButton:draw()
end


function Menu.onExit()
  
end

return Menu
