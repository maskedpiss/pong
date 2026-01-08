local Ball = {}

function Ball:load()
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2
  self.width = 20
  self.height = 20
end


function Ball:update(dt)
  
end


function Ball:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Ball
