
local Credits = {}


local bg

function Credits.load()
  bg = love.graphics.newImage("assets/howtoplay.png")
end

function Credits.draw()
  love.graphics.draw(bg, 0, 0)
end

function Credits.update(dt)
end


return Credits