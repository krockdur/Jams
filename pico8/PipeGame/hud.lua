
hud={}

function get_rand_pipe()
    local a = 0
    
    local tab_pipe_to_rand = {6, 8, 10, 18, 20, 21, 23}
    while a == 0 do
        a = flr(rnd(7))
        if a ~= 0 then
            return pipes[tab_pipe_to_rand[a]]
        end
        
    end

end

hud.tab_incommings_pipe={}
-- pour simulation
hud.tab_incommings_pipe[1]=get_rand_pipe()
hud.tab_incommings_pipe[2]=get_rand_pipe()
hud.tab_incommings_pipe[3]=get_rand_pipe()

hud.selected_cell = {}
hud.selected_cell.x = 5
hud.selected_cell.y = 5
hud.selected_cell.tile = 11
hud.selected_cell.alpha_color = 9



function init_hud()
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
        mset(hud.selected_cell.x, hud.selected_cell.y, pipes[hud.tab_incommings_pipe[1]]["tile"])
    end
end

function draw_hud()
    
    palt(hud.selected_cell.alpha_color, true)
    spr(hud.selected_cell.tile, hud.selected_cell.x * 8 , hud.selected_cell.y * 8)
    palt()

end