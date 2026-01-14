local Play = {}

local playerOne = nil
local playerTwo = nil
local gameBall = nil
local playerOneX = nil
local playerOneY = nil
local playerTwoX = nil
local playerTwoY = nil

function Play.onEnter()
  Globals.Arena = require("src/objs/arena")
  Globals.Arena:load()
  
  playerOneX = 50
  playerOneY = Globals.Screen.height / 2
  playerTwoX = Globals.Screen.width - 70
  playerTwoY = Globals.Screen.height / 2
  
  Globals.Paddle = require("src/objs/paddle")
  playerOne = Globals.Paddle.new(playerOneX, playerOneY)
  playerTwo = Globals.Paddle.new(playerTwoX, playerTwoY)
  
  Globals.Ball = require("src/objs/ball")
  gameBall = Globals.Ball.new()
end


function Play.update(dt)
  playerOne:update(dt)
  playerTwo:update(dt)
  gameBall:update(dt)
  
  if Globals.Collisions:AABB(gameBall, playerOne) or Globals.Collisions:AABB(gameBall, playerTwo) then
    gameBall.speed = gameBall.speed + (gameBall.speed * 0.1)
    gameBall.xVel = -gameBall.xVel
    local middleBall = gameBall.y + gameBall.height / 2
    local middlePaddleOne = playerOne.y + playerOne.height / 2
    local middlePaddleTwo = playerTwo.y + playerTwo.height / 2
    local collisionPosition
    
    if Globals.Collisions:AABB(gameBall, playerOne) then
      Globals.Sound:playSound(Globals.Sound.HitPaddle1)
      gameBall.x = playerOne.x + playerOne.width
      collisionPosition = middleBall - middlePaddleOne
    elseif Globals.Collisions:AABB(gameBall, playerTwo) then
      Globals.Sound:playSound(Globals.Sound.HitPaddle2)
      gameBall.x = playerTwo.x - gameBall.width
      collisionPosition = middleBall - middlePaddleTwo
    end
    
    gameBall.yVel = collisionPosition * 5
  end
  
  local scored, scorer = gameBall:checkScore()
  if scored then
    if scorer == 1 then
      Globals.playerOneScore = Globals.playerOneScore + 1
    elseif scorer == 2 then
      Globals.playerTwoScore = Globals.playerTwoScore + 1
    end
    
    Globals.Sound:playSound(Globals.Sound.Goal)
    gameBall:reset()
  end
  
  if Globals.playerOneScore > 9 or Globals.playerTwoScore > 9 then
    GameState:changeState("gameOver")
  end
end


function Play.draw()
  Globals.Arena:draw()
  playerOne:draw()
  playerTwo:draw()
  gameBall:draw()
end


function Play.onExit()
  Globals.Arena = nil
  Globals.Paddle = nil
  Globals.Ball = nil
  playerOneX = nil
  playerOneY = nil
  playerTwoX = nil
  playerTwoY = nil
  playerOne = nil
  playerTwo = nil
  gameBall = nil
end

return Play
