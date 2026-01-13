local Menu = {}

local playButton = nil
local exitButton = nil

function Menu.onEnter()
  Menu.Title = {
      font = Globals.Graphics.Fonts.TitleFont,
      text = "Pong"
  }
  
  Globals.Button = require("src/objs/button")
  playButton = Globals.Button.new("Play", (Globals.Screen.width / 2) - Globals.Button.offset, Globals.Screen.height / 2, function()
      GameState:changeState("play")
  end)
  
  exitButton = Globals.Button.new("Exit", (Globals.Screen.width / 2) - Globals.Button.offset, (Globals.Screen.height / 2) + 100, function()
      love.event.quit()
  end)
end


function Menu.update(dt)
  local mouseX, mouseY = love.mouse.getPosition()
  
  playButton:update(dt)
  exitButton:update(dt)
  
  if playButton:isHovering(mouseX, mouseY) or exitButton:isHovering(mouseX, mouseY) then
    if not Globals.hasPlayed then
      Globals.Sound:playSound(Globals.Sound.ButtonHover)
    end
  else
    Globals.hasPlayed = false
  end
end


function Menu.mousepressed(x, y, button)
  if playButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function Menu.draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Globals.Screen.x, 100, Globals.Screen.width, "center")
  
  playButton:draw()
  exitButton:draw()
end


function Menu.onExit()
  playButton = nil
  exitButton = nil
  Menu.Title = nil
  Globals.Button = nil
end

return Menu
