local Menu = {}

function Menu.onEnter()
  Menu.Title = {
      font = love.graphics.newFont(128),
      text = "Pong"
  }
end


function Menu.update(dt)
  
end


function Menu.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, 0, 100, love.graphics.getWidth(), "center")
end


function Menu.onExit()
  
end

return Menu
