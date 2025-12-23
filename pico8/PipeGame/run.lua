print("pipe game")


function _init()
    col = 7
end

function _update()
    if (btnp(5)) then
        col = 8 + rnd(8)
    end
end

function _draw()
    cls(1)
    --map(7, 7, 10, 10, 3, 4)
    --map(7, 7, 10, 100, 3, 4)
    map()
    pset(0, 0, 8)
    pset(127, 127, 8)
end