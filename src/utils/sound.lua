local Sound = {}

function Sound:loadSound()
  self.ButtonHover = love.audio.newSource("res/sfx/ButtonHover.wav", "stream")
  self.ButtonHover:setLooping(false)
  self.ButtonClick = love.audio.newSource("res/sfx/ButtonClick.wav", "static")
  self.HitPaddle1 = love.audio.newSource("res/sfx/HitPaddle1.wav", "static")
  self.HitPaddle2 = love.audio.newSource("res/sfx/HitPaddle2.wav", "static")
  self.HitCeiling = love.audio.newSource("res/sfx/HitCeiling.wav", "static")
  self.HitFloor = love.audio.newSource("res/sfx/HitFloor.wav", "static")
  self.Goal = love.audio.newSource("res/sfx/Goal.wav", "static")
end


function Sound:playSound(sound)
  if not sound:isPlaying() then
    love.audio.play(sound)
    Globals.hasPlayed = true
  end
end


function Sound:stopSound()
  love.audio.stop()
  Globals.hasPlayed = false
end

return Sound
