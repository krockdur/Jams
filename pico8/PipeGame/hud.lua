
hud={}

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

hud.tab_incommings_pipe={}


hud.selected_cell = {}



function init_hud()
    -- pour simulation
    hud.tab_incommings_pipe[1]=get_rand_pipe()
    hud.tab_incommings_pipe[2]=get_rand_pipe()
    hud.tab_incommings_pipe[3]=get_rand_pipe()

    hud.selected_cell.x = 5
    hud.selected_cell.y = 5
    hud.selected_cell.tile = 11
    hud.selected_cell.alpha_color = 9

end

function update_hud()
    if btnp(1) then
        hud.selected_cell.x = hud.selected_cell.x + 1
    end
    if btnp(0) then
        hud.selected_cell.x = hud.selected_cell.x - 1
    end
    if btnp(2) then
        hud.selected_cell.y = hud.selected_cell.y - 1
    end
    if btnp(3) then
        hud.selected_cell.y = hud.selected_cell.y + 1
    end

    if btnp(5) then
        mset(hud.selected_cell.x, hud.selected_cell.y, pipes[hud.tab_incommings_pipe[1]]["tile_dry"])
        deli(hud.tab_incommings_pipe, 1)
        add(hud.tab_incommings_pipe, get_rand_pipe())
        global.update_board = true
    end
end

function draw_hud()
    -- full rect
    rect(0, 127-16+2, 127, 127, 8)
    -- rectangle pipe3
    rect(0, 127-16+2, 16, 127, 8)
    -- rect pipe 2
    rect(16, 127-16+2, 32, 127, 8)
    -- rect pipe 1
    rect(32, 127-16+2, 48, 127, 8)
    -- rect current pipe
    rect(32+1, 127-16+2+1, 48-1, 127-1, 10)
    
    -- cursor
    palt(hud.selected_cell.alpha_color, true)
    spr(hud.selected_cell.tile, hud.selected_cell.x * 8 , hud.selected_cell.y * 8)
    palt()

    -- incommings pipes
    spr(pipes[hud.tab_incommings_pipe[3]]["tile_dry"], 4, 127-8-2)
    spr(pipes[hud.tab_incommings_pipe[2]]["tile_dry"], 20, 127-8-2)
    spr(pipes[hud.tab_incommings_pipe[1]]["tile_dry"], 36, 127-8-2)

end