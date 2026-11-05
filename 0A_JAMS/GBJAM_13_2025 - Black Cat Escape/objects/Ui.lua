local UI = {}

UI.player_time = 0
UI.player_speed = 0
UI.player_fire_range = 0
UI.player_pv = 0

local font


function UI.load()
    font = love.graphics.newFont("assets/PressStart2P-vaV7.ttf", 8)
end

function UI.update(dt, time, pv)
    UI.player_time = time
    UI.player_pv = pv
end

function UI.draw(top_corner_left_x, top_corner_left_y)
    love.graphics.setColor(love.math.colorFromBytes(224, 248, 208))
    love.graphics.rectangle("fill", top_corner_left_x + 5, top_corner_left_y, screengame_width - 5, 20)

    love.graphics.setColor(love.math.colorFromBytes(8, 24, 32))
    love.graphics.setFont(font)
    love.graphics.print("TIME:" .. tostring(UI.player_time), top_corner_left_x + 5, top_corner_left_y+6, 0, 0.9, 0.9 )
    love.graphics.print("PV:" .. tostring(UI.player_pv), top_corner_left_x + screengame_width - 50, top_corner_left_y+6, 0, 0.9, 0.9 )

    love.graphics.setColor(1, 1, 1)
end

function UI.touchpressed( id, x, y, dx, dy, pressure )
end

function UI.touchreleased( id, x, y, dx, dy, pressure )
end

return UI