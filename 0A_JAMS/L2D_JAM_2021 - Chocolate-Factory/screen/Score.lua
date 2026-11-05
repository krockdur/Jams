
local Score = {}


local bg


local font = love.graphics.newFont("assets/SnesItalic-vmAPZ.ttf", 40)
local txtScore = love.graphics.newText(font, "0")

function Score.setScore(score)
  txtScore:set("SCORE : "..tostring(score))  
end

function Score.load()
  bg = love.graphics.newImage("assets/scores.png")
end

function Score.draw()
  love.graphics.draw(bg, 0, 0)
  love.graphics.draw(txtScore, 900, 730)
end

function Score.update(dt)
end


return Score