local Button = {}

local buttonFont = love.graphics.newFont(32)

function Button.new(text, x, y, callback)
  local instance = {}
  setmetatable(instance, { __index = Button })
  
  instance.x = x
  instance.y = y
  instance.width = 175
  instance.height = 75
  instance.text = text
  
  instance.callback = callback or function() end
  
  return instance
end


function Button:update(dt)
  
end


function Button:isHovering(x, y)
  return x > self.x and x < self.x + self.width and
         y > self.y and y < self.y + self.height
end


function Button:mousepressed(x, y, button)
  if button == 1 and self:isHovering(x, y) then
    self.callback()
    return true
  end
  return false
end


function Button:draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  
  love.graphics.setColor(Globals.Graphics.Colors.black)
  love.graphics.setFont(buttonFont)
  love.graphics.printf(self.text, self.x, self.y, self.width, "center")
end

return Button
