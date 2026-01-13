Globals = {}
Globals.Arena = nil
Globals.Paddle = nil
Globals.Ball = nil
Globals.Button = nil
Globals.Collisions = require("src/utils/collisions")
Globals.Graphics = require("src/utils/graphics")
Globals.Sound = require("src/utils/sound")
Globals.playerOneScore = 0
Globals.playerTwoScore = 0

GameState = {
    current = nil,
    state = {
        menu = require("src/states/menu"),
        play = require("src/states/play"),
        gameOver = require("src/states/gameover")
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
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.Graphics:loadGraphics()
  Globals.Graphics:loadFonts()
  Globals.Sound:loadSound()
  GameState:changeState("menu")
end


function love.update(dt)
  if GameState.current and GameState.current.update then
    GameState.current.update(dt)
  end
end


function love.draw()
  if GameState.current and GameState.current.draw then
    GameState.current.draw()
  end
end


function love.mousepressed(x, y, button)
  if GameState.current and GameState.current.mousepressed then
    GameState.current.mousepressed(x, y, button)
  end
end
