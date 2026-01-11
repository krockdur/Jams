
hud={}
hud.selected_cell_style = {}

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
    palt(hud.selected_cell_style.alpha_color, true)
    spr(hud.selected_cell_style.tile, global.selected_cell.x * 8 , global.selected_cell.y * 8)
    palt()

    -- incommings pipes
    spr(pipes[game.tab_deck_tiles[3]]["tile_dry"], 4, 127-8-2)
    spr(pipes[game.tab_deck_tiles[2]]["tile_dry"], 20, 127-8-2)
    spr(pipes[game.tab_deck_tiles[1]]["tile_dry"], 36, 127-8-2)

end