
local Menu = {}

local bg
local selector

local posXselector = 415
local posYselector = 255

local pos = 1

function Menu.load()
  bg = love.graphics.newImage("assets/menu.png")
  selector = love.graphics.newImage("assets/menu-selector.png")
end

function Menu.draw()
  love.graphics.draw(bg, 0, 0)
  love.graphics.draw(selector, posXselector, posYselector)
end

function Menu.update(dt)

  if pos == 1 then
    posXselector = 415
    posYselector = 240
  end

  if pos == 2 then
    posXselector = 415
    posYselector = 372
  end

  if pos == 3 then
    posXselector = 415
    posYselector = 502
  end

end

function Menu.mousemoved(x, y, dx, dy, istouch)
  if x >= 490 and x <= 895 and y >= 245 and y <= 300 then
    pos = 1
  end

  if x >= 490 and x <= 895 and y >= 370 and y <= 435 then
    pos = 2
  end

  if x >= 490 and x <= 895 and y >= 500 and y <= 570 then
    pos = 3
  end
end

function Menu.mousepressed(x, y, button, istouch)

end

return Menu