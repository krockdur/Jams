
game = {}
game.tab_deck_tiles={}
game.selected_pipe_deck=1
game.energy = 100
game.nb_bonus_wet = 0
local p_en = 10 -- pipe on empty tile energy cost
local ov_p_en = 20 -- overrider pipe energy cost
local bo_p_en = 10 -- bonus pipe wet energy win

function get_rand_pipe()
    local a = 0
    
    local tab_pipe_to_rand = {6, 8, 10, 18, 20, 21, 23}
    while a == 0 do
        a = flr(rnd(8))
        if a ~= 0 then
            return pipes[tab_pipe_to_rand[a]]
        end
        
    end

end

function get_rand_corner_pipe()
    local a = 0
    
    local tab_pipe_to_rand = {18, 20, 21, 23}
    while a == 0 do
        a = flr(rnd(5))
        if a ~= 0 then
            return pipes[tab_pipe_to_rand[a]]
        end
        
    end
end

function get_rand_linear_pipe()
    local a = 0
    
    local tab_pipe_to_rand = {6, 8, 10}
    while a == 0 do
        a = flr(rnd(4))
        if a ~= 0 then
            return pipes[tab_pipe_to_rand[a]]
        end
        
    end
end


function init_game()
	
	-- populate deck
    game.tab_deck_tiles[1]=get_rand_corner_pipe()
    game.tab_deck_tiles[2]=get_rand_linear_pipe()
    game.tab_deck_tiles[3]=get_rand_linear_pipe()
	
end

function update_game()

	-- update selected pipe from deck
	game.selected_pipe_deck = pipes[game.tab_deck_tiles[global.sel_index_deck_pipe + 1]]["tile_dry"]

	-- Add pipe on the board
    if btnp(5) then
         -- energy
        if mget(global.selected_cell.x, global.selected_cell.y) == 0 then game.energy -= 10 else game.energy -= 20 end
		-- add pipe
        mset(global.selected_cell.x, global.selected_cell.y, game.selected_pipe_deck)
        -- delete pipe from deck
		-- deli(game.tab_deck_tiles, global.sel_index_deck_pipe+1)
		-- add pipe to the deck
        -- add(game.tab_deck_tiles, get_rand_pipe())
		if global.sel_index_deck_pipe == 0 then game.tab_deck_tiles[1]=get_rand_corner_pipe() end
		if global.sel_index_deck_pipe == 1 then game.tab_deck_tiles[2]=get_rand_linear_pipe() end
		if global.sel_index_deck_pipe == 2 then game.tab_deck_tiles[3]=get_rand_linear_pipe() end
		-- update board
        global.update_board = true
    end
	
	
end

