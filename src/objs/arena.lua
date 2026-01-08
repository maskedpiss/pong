local Arena = {}

function Arena:load()
  self.Goal = {
      x = 0,
      y = 0,
      width = 30,
      height = love.graphics.getHeight()
  }
  
  self.Divider = {
      x = love.graphics.getWidth() / 2,
      y = 0,
      width = 10,
      height = love.graphics.getHeight(),
      offset = 5
  }
  
  self.Center = {
      x = love.graphics.getWidth() / 2,
      y = love.graphics.getHeight() / 2,
      radius = 100
  }
  
end


function Arena:update(dt)
  
end


function Arena:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.Goal.x, self.Goal.y, self.Goal.width, self.Goal.height)
  love.graphics.rectangle("fill", love.graphics.getWidth() - self.Goal.width, self.Goal.y, self.Goal.width, self.Goal.height)
  
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.rectangle("fill", self.Divider.x - self.Divider.offset, self.Divider.y, self.Divider.width, self.Divider.height)
  
  love.graphics.circle("line", self.Center.x, self.Center.y, self.Center.radius)
end

return Arena
