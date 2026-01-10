local GameOver = {}

function GameOver.onEnter()
  GameOver.Message = {
      font = love.graphics.newFont(128),
      x = 0,
      y = 100,
      text = "Game Over!"
  }
end


function GameOver.update(dt)
  
end


function GameOver.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, love.graphics.getWidth(), "center")
end


function GameOver.onExit()
  
end

return GameOver
