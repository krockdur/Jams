
local menu = require('screen.Menu')
local credits = require('screen.Credits')
local game = require('screen.Game')
local options = require('screen.Options')
local score = require('screen.Score')

local ScreenManager = {}

ScreenManager.screen = "menu"


-- sound
local musicGame = love.audio.newSource("assets/sounds/track1.wav", "stream")


function ScreenManager.load()

  musicGame:setVolume(0.5)
  musicGame:setLooping(true)
  --musicGame:play()

  menu.load()
  game.load()
  score.load()
  credits.load()
  options.load()

end

function ScreenManager.draw()

  if ScreenManager.screen == "menu" then
    menu.draw()
  end

  if ScreenManager.screen == "game" then
    game.draw()
  end

  if ScreenManager.screen == "score" then
    score.draw()
  end

  if ScreenManager.screen == "credit" then
    credits.draw()
  end

  if ScreenManager.screen == "options" then
    options.draw()
  end

end

function ScreenManager.update(dt)

  if ScreenManager.screen == "menu" then
    menu.update(dt)
  end

  if ScreenManager.screen == "game" then
    game.update(dt)
    
    if game.finish == true then
      score.setScore(game.score)
      ScreenManager.screen = "score"
    end
  
  end

  if ScreenManager.screen == "score" then
    score.update(dt)
  end

  if ScreenManager.screen == "credit" then
    credits.update(dt)
  end

  if ScreenManager.screen == "options" then
    options.update(dt)
  end
  


end


function ScreenManager.mousepressed(x, y, button, istouch)
  if ScreenManager.screen == "game" then
    game.mousepressed(x, y, button, istouch)
  end

  if ScreenManager.screen == "menu" then

    if x >= 490 and x <= 895 and y >= 245 and y <= 300 then
      game.isQwerty = true
      game.setKeyboard()
      ScreenManager.screen = "game"
    end

    if x >= 490 and x <= 895 and y >= 370 and y <= 435 then
      game.isQwertty = false
      game.setKeyboard()
      ScreenManager.screen = "game"
    end

    if x >= 490 and x <= 895 and y >= 500 and y <= 570 then
      ScreenManager.screen = "credit"
    end

  end
end

function ScreenManager.mousereleased(x, y, button, istouch)
end

function ScreenManager.keypressed(key)
  if ScreenManager.screen == "game" then
    game.keypressed(key)
  end
  
  if ScreenManager.screen == "score" then
    if key == "space" then
        
        game.finish = false
        game.init()
        
        ScreenManager.screen = "game"
        
    end    
  end
  
  if ScreenManager.screen == "credit" then
    if key == "space" then
        ScreenManager.screen = "menu"        
    end    
  end
  
end

function ScreenManager.keyreleased(key)
end

function ScreenManager.mousemoved(x, y, dx, dy, istouch)

  if ScreenManager.screen == "menu" then
    menu.mousemoved(x, y, dx, dy, istouch)
  end

end


return ScreenManager