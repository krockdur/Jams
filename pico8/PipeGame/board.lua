nb_tile_x = 128 / 8
nb_tile_y = 128 / 8

board = {}

--board[j][i] = {type, wet}

-- compare p1 with p2 (x+1 or y+1)
function are_pipes_left_and_rigth_connected(p1, p2) -- ex 17, 22
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        -- left and right
        if pipes[pipes[p1]].connected[4] == 1 and pipes[pipes[p2]].connected[3] == 1 then
            connected = true
        end
    end
    return connected
end

function are_pipes_top_and_down_connected(p1, p2) -- ex 17, 22
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        -- bot and top

        if pipes[pipes[p1]].connected[2] == 1 and pipes[pipes[p2]].connected[1] == 1 then
            connected = true
        end
    end
    return connected
end

function init_board()

end

function update_board()
    if global.update_board == true then
        local updating = true

        -- make all pipes dry
        for j = 0, 15 do
            for i = 0, 15 do
                if fget(mget(i, j)) == 2 then
                    mset(i, j, pipes[pipes[mget(i, j)]].tile_dry)
                end
            end
        end
        -- update wet pipes
        while updating do

            updating = false
            for j = 0, 15 do
                for i = 0, 15 do

                    if are_pipes_left_and_rigth_connected(mget(i, j), mget(i + 1, j)) == true then
                        if (fget(mget(i, j)) == 2 and fget(mget(i + 1, j)) == 1)  or (fget(mget(i, j)) == 1 and fget(mget(i + 1, j)) == 2) then
                            updating = true
                            -- to wet
                            mset(i, j, pipes[pipes[mget(i, j)]].tile_wet)
                            mset(i + 1, j, pipes[pipes[mget(i + 1, j)]].tile_wet)
                        end
                    end


                    if are_pipes_top_and_down_connected(mget(i, j), mget(i, j + 1)) == true then

                        if (fget(mget(i, j)) == 2 and fget(mget(i, j + 1)) == 1) or (fget(mget(i, j)) == 1 and fget(mget(i, j + 1)) == 2) then
                            updating = true
                            -- to wet
                            printh("tile i j : " .. mget(i, j), "debug", true, true)
                            printh("tile i j+1 : " .. mget(i, j+1), "debug",false, true)
                            mset(i, j, pipes[pipes[mget(i, j)]].tile_wet)
                            mset(i, j + 1, pipes[pipes[mget(i, j + 1)]].tile_wet)
                        end
                        
                    end
                end
            end

        end
        global.update_board = false
    end
end

function draw_board()
    map()
end
