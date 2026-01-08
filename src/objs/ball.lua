local Ball = {}

function Ball:load()
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
  
  if Globals.Collisions:AABB(self, playerOne) then
    self.xVel = -self.xVel
    local middleBall = self.y + self.height / 2
    local middlePaddle = playerOne.y + playerOne.height / 2
    local collisionPosition = middleBall - middlePaddle
    self.yVel = collisionPosition * 5
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
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Ball
