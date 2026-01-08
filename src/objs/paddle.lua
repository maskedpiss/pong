local Paddle = {}

function Paddle:load()
  self.x = 50
  self.y = love.graphics.getHeight() / 2
  self.width = 20
  self.height = 100
end


function Paddle:update(dt)
  
end


function Paddle:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Paddle
