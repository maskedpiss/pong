local GameOver = {}

local menuButton = nil
local retryButton = nil
local exitButton = nil

function GameOver.onEnter()
  GameOver.Message = {
      font = Globals.Graphics.Fonts.TitleFont,
      x = 0,
      y = 100,
      text = "Game Over!"
  }
  
  if Globals.playerOneScore > Globals.playerTwoScore then
    GameOver.Message.text = "Player One Wins!"
  else
    GameOver.Message.text = "Player Two Wins!"
  end
  
  Globals.Button = require("src/objs/button")
  menuButton = Globals.Button.new("Menu", (Globals.Screen.width / 2) - Globals.Button.offset, Globals.Screen.height / 2, function()
      GameState:changeState("menu")
  end)

  retryButton = Globals.Button.new("Retry", (Globals.Screen.width / 2) - Globals.Button.offset, (Globals.Screen.height / 2) + 100, function()
      GameState:changeState("play")
  end)

  exitButton = Globals.Button.new("Exit", (Globals.Screen.width / 2) - Globals.Button.offset, (Globals.Screen.height / 2) + 200, function()
      love.event.quit()
  end)
end


function GameOver.update(dt)
  local mouseX, mouseY = love.mouse.getPosition()
  
  menuButton:update(dt)
  retryButton:update(dt)
  exitButton:update(dt)
  
  if menuButton:isHovering(mouseX, mouseY) or retryButton:isHovering(mouseX, mouseY) or exitButton:isHovering(mouseX, mouseY) then
    if not Globals.hasPlayed then
      Globals.Sound:playSound(Globals.Sound.ButtonHover)
    end
  else
    Globals.hasPlayed = false
  end
end


function GameOver.mousepressed(x, y, button)
  if menuButton:mousepressed(x, y, button) then
    return
  end
  
  if retryButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function GameOver.draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, love.graphics.getWidth(), "center")
  
  menuButton:draw()
  retryButton:draw()
  exitButton:draw()
end


function GameOver.onExit()
  Globals.playerOneScore = 0
  Globals.playerTwoScore = 0
  GameOver.Message = nil
  Globals.Button = nil
  menuButton = nil
  retryButton = nil
  exitButton = nil
end

return GameOver
