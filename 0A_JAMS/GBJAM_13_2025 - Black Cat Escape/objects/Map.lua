local Map = {}

tab_map = {}
tab_enemies = {}

local sprite_tileset

local q_0
local q_1
local q_2
local q_3
local q_5
local q_6
local q_7
local q_8
local q_10
local q_11
local q_12
local q_13
local q_15
local q_16
local q_17
local q_18
local q_20
local q_21
local q_22
local q_23
local q_25
local q_26
local q_27
local q_28
local q_30
local q_31
local q_32


local function splitCsvLine(line)
    local values = {}

    for value in line:gmatch("([^,]*)") do
        table.insert(values, tonumber(value))
    end

    return values
end

local function loadCsvFile(filename)
    local csv = {}
    for line in love.filesystem.lines(filename) do
        table.insert(csv, splitCsvLine(line))
    end
    return csv
end

function Map.load()
    tab_map = loadCsvFile("map.csv")
    tab_enemies = loadCsvFile("enemies.csv")

    sprite_tileset = love.graphics.newImage("assets/tileset.png")
    
    q_0     =love.graphics.newQuad(64*0, 64*0, 64, 64, sprite_tileset)
    q_1     =love.graphics.newQuad(64*1, 64*0, 64, 64, sprite_tileset)
    q_2     =love.graphics.newQuad(64*2, 64*0, 64, 64, sprite_tileset)
    q_3     =love.graphics.newQuad(64*3, 64*0, 64, 64, sprite_tileset)

    q_5     =love.graphics.newQuad(64*0, 64*1, 64, 64, sprite_tileset)
    q_6     =love.graphics.newQuad(64*1, 64*1, 64, 64, sprite_tileset)
    q_7     =love.graphics.newQuad(64*2, 64*1, 64, 64, sprite_tileset)
    q_8     =love.graphics.newQuad(64*3, 64*1, 64, 64, sprite_tileset)

    q_10    =love.graphics.newQuad(64*0, 64*2, 64, 64, sprite_tileset)
    q_11    =love.graphics.newQuad(64*1, 64*2, 64, 64, sprite_tileset)
    q_12    =love.graphics.newQuad(64*2, 64*2, 64, 64, sprite_tileset)
    q_13    =love.graphics.newQuad(64*3, 64*2, 64, 64, sprite_tileset)

    q_15    =love.graphics.newQuad(64*0, 64*3, 64, 64, sprite_tileset)
    q_16    =love.graphics.newQuad(64*1, 64*3, 64, 64, sprite_tileset)
    q_17    =love.graphics.newQuad(64*2, 64*3, 64, 64, sprite_tileset)
    q_18    =love.graphics.newQuad(64*3, 64*3, 64, 64, sprite_tileset)

    q_20    =love.graphics.newQuad(64*0, 64*4, 64, 64, sprite_tileset)
    q_21    =love.graphics.newQuad(64*1, 64*4, 64, 64, sprite_tileset)
    q_22    =love.graphics.newQuad(64*2, 64*4, 64, 64, sprite_tileset)
    q_23    =love.graphics.newQuad(64*3, 64*4, 64, 64, sprite_tileset)

    q_25    =love.graphics.newQuad(64*0, 64*5, 64, 64, sprite_tileset)
    q_26    =love.graphics.newQuad(64*1, 64*5, 64, 64, sprite_tileset)
    q_27    =love.graphics.newQuad(64*2, 64*5, 64, 64, sprite_tileset)
    q_28    =love.graphics.newQuad(64*3, 64*5, 64, 64, sprite_tileset)

    q_30    =love.graphics.newQuad(64*0, 64*7, 64, 64, sprite_tileset)
    q_31    =love.graphics.newQuad(64*1, 64*7, 64, 64, sprite_tileset)
    q_32    =love.graphics.newQuad(64*2, 64*7, 64, 64, sprite_tileset)
end

function Map.draw()
    for j = 1, NB_MAP_TILES_Y do
        for i = 1, NB_MAP_TILES_X do

            if tab_map[j][i] == 0 then
                love.graphics.draw( sprite_tileset, q_0,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 1 then
                love.graphics.draw( sprite_tileset, q_1,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 2 then
                love.graphics.draw( sprite_tileset, q_2,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 3 then
                love.graphics.draw( sprite_tileset, q_3,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

            if tab_map[j][i] == 5 then
                love.graphics.draw( sprite_tileset, q_5,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 6 then
                love.graphics.draw( sprite_tileset, q_6,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 7 then
                love.graphics.draw( sprite_tileset, q_7,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 8 then
                love.graphics.draw( sprite_tileset, q_8,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

            if tab_map[j][i] == 10 then
                love.graphics.draw( sprite_tileset, q_10,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 11 then
                love.graphics.draw( sprite_tileset, q_11,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 12 then
                love.graphics.draw( sprite_tileset, q_12,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 13 then
                love.graphics.draw( sprite_tileset, q_13,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

            if tab_map[j][i] == 15 then
                love.graphics.draw( sprite_tileset, q_15,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 16 then
                love.graphics.draw( sprite_tileset, q_16,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 17 then
                love.graphics.draw( sprite_tileset, q_17,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 18 then
                love.graphics.draw( sprite_tileset, q_18,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

            if tab_map[j][i] == 20 then
                love.graphics.draw( sprite_tileset, q_20,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 21 then
                love.graphics.draw( sprite_tileset, q_21,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 22 then
                love.graphics.draw( sprite_tileset, q_22,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 23 then
                love.graphics.draw( sprite_tileset, q_23,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

            if tab_map[j][i] == 25 then
                love.graphics.draw( sprite_tileset, q_25,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 26 then
                love.graphics.draw( sprite_tileset, q_26,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 27 then
                love.graphics.draw( sprite_tileset, q_27,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 28 then
                love.graphics.draw( sprite_tileset, q_28,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

            if tab_map[j][i] == 30 then
                love.graphics.draw( sprite_tileset, q_30,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 31 then
                love.graphics.draw( sprite_tileset, q_31,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end
            if tab_map[j][i] == 32 then
                love.graphics.draw( sprite_tileset, q_32,    (i * TILE_SIZE) - TILE_SIZE,    (j * TILE_SIZE) - TILE_SIZE)
            end

        end
    end

    love.graphics.setColor(1, 1, 1)
end

return Map
