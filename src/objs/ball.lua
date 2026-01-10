local Ball = {}

function Ball.new()
  local instance = {}
  setmetatable(instance, { __index = Ball })
  
  instance:reset()
  
  return instance
end


function Ball:reset()
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.width = 20
  self.height = 20
  self.speed = 200
  self.xVel = -self.speed
  self.yVel = 0
end


function Ball:update(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
  
  if self.x < 0 or self.x > love.graphics.getWidth() then
    self:checkScore()
  end
  
  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  end
  
  if self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
    self.yVel = -self.yVel
  end
end


function Ball:draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


function Ball:checkScore()
  if self.x + self.width < 0 then
    return true, 2
  elseif self.x > love.graphics.getWidth() then
    return true, 1
  end
  return false, nil
end

return Ball
