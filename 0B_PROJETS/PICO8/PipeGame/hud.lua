
hud={}
hud.selected_cell_style = {}	-- selected cell style on the board


function init_hud()

    hud.selected_cell_style.tile = 11
    hud.selected_cell_style.alpha_color = 9

end

function update_hud()

    if btnp(1) then
        global.selected_cell.x = global.selected_cell.x + 1
    end
    if btnp(0) then
        global.selected_cell.x = global.selected_cell.x - 1
    end
    if btnp(2) then
        global.selected_cell.y = global.selected_cell.y - 1
    end
    if btnp(3) then
        global.selected_cell.y = global.selected_cell.y + 1
    end
	-- change selection of the pipe to add
	if btnp(4) then
		global.sel_index_deck_pipe = global.sel_index_deck_pipe + 1
		if global.sel_index_deck_pipe > 2 then global.sel_index_deck_pipe = 0 end		
	end

end

function draw_hud()
    -- full rect
    line(0, 127-16+2, 127, 127-16+2, 8)
    
    -- cursor
	spr(game.selected_pipe_deck, global.selected_cell.x * 8 , global.selected_cell.y * 8)
	rect(global.selected_cell.x * 8 - 1, global.selected_cell.y * 8 - 1, global.selected_cell.x * 8 + 8 , global.selected_cell.y * 8 + 8 , 11)
	
	-- deck selected pipe- a finir
    --rect( global.sel_index_deck_pipe * 8 , 127-16+2+1, global.sel_index_deck_pipe * 16 + 10 -1, 127-1, 10 )
    if global.sel_index_deck_pipe == 0 then rect( 0 , 114, 9, 126, 9 ) end
    if global.sel_index_deck_pipe == 1 then rect( 0+8+2 , 114, 9+8+2, 126, 10 ) end
    if global.sel_index_deck_pipe == 2 then rect( 0+8+8+4 , 114, 9+8+8+4, 126, 8 ) end

    -- deck
    spr(pipes[game.tab_deck_tiles[1]]["tile_dry"], 1, 127-8-2)
    spr(pipes[game.tab_deck_tiles[2]]["tile_dry"], 1+8+2, 127-8-2)
    spr(pipes[game.tab_deck_tiles[3]]["tile_dry"], 1+8+2+8+2, 127-8-2)

    -- energy
    for i = 0, -1+game.energy/10 do
        spr(11, 38+i*8, 117)
    end

    -- bonus
    print(game.nb_bonus_wet, 122, 119, 10)
end