nb_tile_x = 128 / 8
nb_tile_y = 128 / 8

board = {}

function are_pipe_conn_to_right(p1, p2)
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        if pipes[pipes[p1]].connected[4] == 1 and pipes[pipes[p2]].connected[3] == 1 then
            connected = true
        end
    end
    return connected
end

function are_pipe_conn_to_left(p1, p2)
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        if pipes[pipes[p1]].connected[3] == 1 and pipes[pipes[p2]].connected[4] == 1 then
            connected = true
        end
    end
    return connected
end

function are_pipe_conn_to_down(p1, p2)
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        if pipes[pipes[p1]].connected[2] == 1 and pipes[pipes[p2]].connected[1] == 1 then
            connected = true
        end
    end
    return connected
end

function are_pipe_conn_to_top(p1, p2)
    local connected = false
    if p1 ~= 0 and p2 ~= 0 then
        if pipes[pipes[p1]].connected[1] == 1 and pipes[pipes[p2]].connected[2] == 1 then
            connected = true
        end
    end
    return connected
end

function is_wet(i, j)
	if fget(mget(i, j), 1) == true then return true else return false end
end

function is_cross_hori_wet(i, j)
	if fget(mget(i, j), 2) == true then return true else return false end
end

function is_cross_verti_wet(i, j)
	if fget(mget(i, j), 3) == true then return true else return false end
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

                    local c_to_right = are_pipe_conn_to_right(mget(i, j), mget(i + 1, j))
                    local c_to_left = are_pipe_conn_to_left(mget(i, j), mget(i - 1, j))
                    local c_to_down = are_pipe_conn_to_down(mget(i, j), mget(i, j + 1))
                    local c_to_top = are_pipe_conn_to_top(mget(i, j), mget(i, j - 1))

                    if not is_wet(i, j) and mget(i, j) ~= 0 then
                        local c_tile = mget(i, j)
						
						-- stop("not tile wet : " .. c_tile)
						
                        if c_tile == 1 or c_tile == 2 or c_tile == 3 or c_tile == 4 or c_tile == 6 or c_tile == 8 or c_tile == 18 or c_tile == 20 or c_tile == 21 or c_tile == 23  then
							printh("c_tile : " .. c_tile, "debug", false, true)
                            if c_to_down and (is_wet(i, j+1) or is_cross_verti_wet(i, j+1)) then
								--stop("c_to_down")
                                mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet)
								printh("c_to_down i : " .. i .. "  j : " .. j .. "  tile : " .. c_tile, "debug", false, true)
								updating = true
                            end
							if c_to_top and (is_wet(i, j-1) or is_cross_verti_wet(i, j-1)) then
								--stop("c_to_top")
                                mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet)
								printh("c_to_top i : " .. i .. "  j : " .. j .. "  tile : " .. c_tile, "debug", false, true)
								updating = true
                            end
							if c_to_left and (is_wet(i-1, j) or is_cross_hori_wet(i-1, j)) then
								--stop("c_to_left")
                                mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet)
								printh("c_to_left i : " .. i .. "  j : " .. j .. "  tile : " .. c_tile, "debug", false, true)
								updating = true
                            end
							if c_to_right and (is_wet(i+1, j) or is_cross_hori_wet(i+1, j)) then
								--stop("c_to_right")
                                mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet)
								printh("c_to_right i : " .. i .. "  j : " .. j .. "  tile : " .. c_tile, "debug", false, true)
								updating = true
                            end
						end
						
						if c_tile == 10 then
							if (c_to_down and is_wet(i, j + 1)) or (c_to_top and is_wet(i, j - 1)) and (not c_to_left or (c_to_left and not is_wet(i-1, j))) and (not c_to_right or (c_to_right and not is_wet(i+1, j))) then
								mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet_verti)
							end
							
							if (c_to_left and is_wet(i - 1, j)) or (c_to_right and is_wet(i + 1, j)) and (not c_to_down or (c_to_down and not is_wet(i, j+1))) and (not c_to_top or (c_to_top and not is_wet(i, j - 1))) then
								mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet_hori)
							end
						end
						
						if c_tile == 10 or c_tile == 25 or c_tile == 26 then
							if ((c_to_down and is_wet(i, j + 1)) or (c_to_top and is_wet(i, j - 1))) and ((c_to_left and is_wet(i - 1, j)) or (c_to_right and is_wet(i + 1, j))) then
								mset(i, j, pipes[pipes[mget(i, j)] ].tile_wet)
							end							
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
