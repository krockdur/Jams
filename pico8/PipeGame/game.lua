
game = {}
game.tab_deck_tiles={}
game.selected_pipe_deck=1
game.energy = 100
--[[
	dry pipe = -10
	wet pipe = +10
	bonus
	end
]]

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


function init_game()

    -- pour simulation
    game.tab_deck_tiles[2]=get_rand_pipe()
    game.tab_deck_tiles[1]=get_rand_pipe()
    game.tab_deck_tiles[3]=get_rand_pipe()
	
end

function update_game()

	-- update selected pipe from deck
	game.selected_pipe_deck = pipes[game.tab_deck_tiles[global.sel_index_deck_pipe + 1]]["tile_dry"]

	-- Add pipe on the board
    if btnp(5) then
		-- add pipe
        mset(global.selected_cell.x, global.selected_cell.y, game.selected_pipe_deck)
        -- delete pipe from deck
		deli(game.tab_deck_tiles, global.sel_index_deck_pipe+1)
		-- add pipe to the deck
        add(game.tab_deck_tiles, get_rand_pipe())
		-- update board
        global.update_board = true
    end
	
	
end

