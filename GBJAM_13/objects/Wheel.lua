
local Wheel = {}

local wheel_sprite

Wheel.is_running = false

function Wheel.load()

    wheel_sprite = love.graphics.newImage("assets/wheel.png")

    Wheel.is_running = true

end

local a = 0
function Wheel.update(dt)

    if (Wheel.is_running) then
        
        a = a + 1

    end

end

function Wheel.draw(top_left_x, top_left_y)

    love.graphics.draw(wheel_sprite, top_left_x, top_left_y)

end


function Wheel.keypressed(key, scancode, isrepeat)

    if (key == "a") then

    end

end


return Wheel