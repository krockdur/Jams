
local Background = {}



function Background.load()

    Background.image = love.graphics.newImage("Assets/plateau.png")

end


function Background.update(dt)



end

function Background.draw()

    love.graphics.draw(Background.image, 0, 0)

end



return Background