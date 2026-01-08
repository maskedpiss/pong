local Arena = {}

function Arena:load()
  self.Goal = {
      x = 0,
      y = 0,
      width = 30,
      height = love.graphics.getHeight()
  }
  
  self.Divider = {}
  self.Center = {}
end


function Arena:update(dt)
  
end


function Arena:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.Goal.x, self.Goal.y, self.Goal.width, self.Goal.height)
  love.graphics.rectangle("fill", love.graphics.getWidth() - self.Goal.width, self.Goal.y, self.Goal.width, self.Goal.height)
end

return Arena
