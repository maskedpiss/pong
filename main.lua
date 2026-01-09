Globals = {}
Globals.Arena = nil
Globals.Paddle = nil
Globals.Ball = nil
Globals.Collisions = require("src/utils/collisions")
Globals.playerOneScore = 0
Globals.playerTwoScore = 0

GameState = {
    current = nil,
    state = {
        menu = nil
    }
}

function GameState:changeState(newState)
  if GameState.current and GameState.current.onExit then
    GameState.current.onExit()
  end
  
  GameState.current = GameState.state[newState]
  
  if GameState.current and GameState.current.onEnter then
    GameState.current.onEnter()
  end
end


function love.load()
  
end


function love.update(dt)
  
end


function love.draw()
  
end
