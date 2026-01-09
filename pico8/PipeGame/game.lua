
game = {}
game.tab_incommings_pipe={}


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
    game.tab_incommings_pipe[2]=get_rand_pipe()
    game.tab_incommings_pipe[1]=get_rand_pipe()
    game.tab_incommings_pipe[3]=get_rand_pipe()
	
end

function update_game()

    if btnp(5) then
        mset(global.selected_cell.x, global.selected_cell.y, pipes[game.tab_incommings_pipe[1]]["tile_dry"])
        deli(game.tab_incommings_pipe, 1)
        add(game.tab_incommings_pipe, get_rand_pipe())
        global.update_board = true
    end
	
	
end

