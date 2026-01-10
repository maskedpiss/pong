local Paddle = {}

function Paddle.new(x, y)
  local instance = {}
  setmetatable(instance, { __index = Paddle })
  
  instance.x = x
  instance.y = y
  instance.width = 20
  instance.height = 100
  instance.speed = 500
  
  return instance
end


function Paddle:update(dt)
  local upKey, downKey
  local screenCenter = love.graphics.getWidth() / 2
  
  if self.x < screenCenter then
    upKey = "w"
    downKey = "s"
  elseif self.x > screenCenter then
    upKey = "up"
    downKey = "down"
  end
  
  if love.keyboard.isDown(upKey) then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown(downKey) then
    self.y = self.y + self.speed * dt
  end
  
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
  end
end


function Paddle:draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Paddle
