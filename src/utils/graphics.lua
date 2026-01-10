local Graphics = {}

function Graphics:loadGraphics()
  self.Colors = {
      white = { 1, 1, 1 },
      black = { 0, 0, 0 },
      green = { 0, 1, 0 },
      gray = { 0.5, 0.5, 0.5 }
  }
end

return Graphics
