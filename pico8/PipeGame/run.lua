
global = {}
global.update_board = false

function _init()
    init_board()
    init_hud()
end

function _update()
    update_board()
    update_hud()
end

function _draw()
    cls()

    draw_board()
    draw_hud()

end