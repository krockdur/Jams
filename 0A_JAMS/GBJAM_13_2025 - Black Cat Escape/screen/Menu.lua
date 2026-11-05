
local Menu = {}

Menu.status = "none"

local font

function Menu.load()
    font = love.graphics.newFont("assets/PressStart2P-vaV7.ttf", 8)
end

function Menu.draw()
    love.graphics.push()

    love.graphics.origin()

    love.graphics.setColor(love.math.colorFromBytes(224, 248, 208))
    love.graphics.rectangle("fill", 0, 0, screengame_width , screengame_height)

    love.graphics.setColor(love.math.colorFromBytes(8, 24, 32))
    love.graphics.setFont(font)
    love.graphics.print("BLACK CAT'S ESCAPE", 10, 20, 0, 0.9, 0.9 )
    love.graphics.print("Find the exit, but :", 10, 50, 0, 0.9, 0.9 )
    love.graphics.print("re you lucky enough?", 10, 60, 0, 0.9, 0.9 )

    love.graphics.print("Press (ENTER) to try", 10, 100, 0, 0.9, 0.9 )

    love.graphics.setColor(1, 1, 1)

    love.graphics.pop()
end

function Menu.update(dt)


end

function Menu.keypressed(key, scancode, isrepeat)
    if key == "return" then
        Menu.status = "play"
    end
end

function Menu.mousemoved(x, y, dx, dy, istouch)

end

function Menu.mousepressed(x, y, button, istouch)

end

return Menu