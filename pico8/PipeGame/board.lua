

nb_tile_x = 128/8
nb_tile_y = 128/8

board={}

--board[j][i] = {type, wet}

-- compare p1 with p2 (x+1 or y+1)
function are_pipes_left_and_rigth_connected(p1, p2) -- ex 17, 22
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        print("p1 " .. p1)
        print("p2 " .. p2)
        for k1, v1 in pairs(pipes[pipes[p1]].connected) do
            for k2, v2 in pairs(pipes[pipes[p2]].connected) do
                if v1 == "right" and v2 == "left" then
                    connected = true
                end
            end
        end
    end
    return connected
end

function are_pipes_top_and_down_connected(p1, p2) -- ex 17, 22
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        print("p1 " .. p1)
        print("p2 " .. p2)
        for k1, v1 in pairs(pipes[pipes[p1]].connected) do
            for k2, v2 in pairs(pipes[pipes[p2]].connected) do
                if v1 == "bot" and v2 == "top" then
                    connected = true
                end
            end
        end
    end
    return connected
end

function init_board()

end

function update_board()

    if global.update_board == true then
        local updating = true
        while updating do
            for j=0, 15 do
                for i=0, 15 do
                    if are_pipes_left_and_rigth_connected(mget(i, j), mget(i+1, j)) == true then
                        updating = true
                        if fget(mget(i, j)) == 2 or fget(mget(i+1, j)) == 2 then
                            -- to wet
                            mset(i, j, pipes[pipes[mget(i, j)]].tile_wet)
                            mset(i+1, j, pipes[pipes[mget(i+1, j)]].tile_wet)
                        end
                    else
                        updating = false
                    end
                    if are_pipes_top_and_down_connected(mget(i, j), mget(i, j+1)) == true then
                        updating = true
                        if fget(mget(i, j)) == 2 or fget(mget(i, j+1)) == 2 then
                            -- to wet
                            mset(i, j, pipes[pipes[mget(i, j)]].tile_wet)
                            mset(i, j+1, pipes[pipes[mget(i, j+1)]].tile_wet)
                        end
                    else
                        updating = false
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