
global = {}
global.update_board = false
global.selected_cell = {}

function _init()
    global.selected_cell.x = 5
    global.selected_cell.y = 5
	
	init_game()
    init_board()
    init_hud()
end

function _update()
	
    update_board()
    update_hud()
	update_game()
end

function _draw()
    cls()

    draw_board()
    draw_hud()
end