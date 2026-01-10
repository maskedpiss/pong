local GameOver = {}

local menuButton = nil
local retryButton = nil
local exitButton = nil

function GameOver.onEnter()
  GameOver.Message = {
      font = love.graphics.newFont(128),
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
  menuButton = Globals.Button.new("Menu", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, function()
      GameState:changeState("menu")
  end)

  retryButton = Globals.Button.new("Retry", love.graphics.getWidth() / 2, (love.graphics.getHeight() / 2) + 100, function()
      GameState:changeState("play")
  end)

  exitButton = Globals.Button.new("Exit", love.graphics.getWidth() / 2, (love.graphics.getHeight() / 2) + 200, function()
      love.event.quit()
  end)
end


function GameOver.update(dt)
  
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
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, love.graphics.getWidth(), "center")
  
  menuButton:draw()
  retryButton:draw()
  exitButton:draw()
end


function GameOver.onExit()
  Globals.playerOneScore = 0
  Globals.playerTwoScore = 0
end

return GameOver
