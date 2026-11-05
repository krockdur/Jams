
local Credits = {}

local font

function Credits.load()
    font = love.graphics.newFont("assets/PressStart2P-vaV7.ttf", 8)
end

function Credits.draw()
    love.graphics.push()

    love.graphics.origin()

    love.graphics.setColor(love.math.colorFromBytes(224, 248, 208))
    love.graphics.rectangle("fill", 0, 0, screengame_width , screengame_height)

    love.graphics.setColor(love.math.colorFromBytes(8, 24, 32))
    love.graphics.setFont(font)
    love.graphics.print("UNLUCKY !!!! ;)", 10, 20, 0, 0.9, 0.9 )
    love.graphics.print("FOR GBJAM13 BY JF72", 10, 50, 0, 0.9, 0.9 )

    love.graphics.setColor(1, 1, 1)

    love.graphics.pop()
end

function Credits.update(dt)
end


return Credits