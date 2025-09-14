local Map = {}

tab_map = {}

local function splitCsvLine(line)
	local values = {}

	for value in line:gmatch("([^;]*)") do
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
end

function Map.draw()

    for j = 1, NB_MAP_TILES_Y do
        for i = 1, NB_MAP_TILES_X do
            if tab_map[j][i] == 0 then
                love.graphics.setColor(love.math.colorFromBytes(224, 248, 208))
            end
            if tab_map[j][i] == 1 then
                love.graphics.setColor(love.math.colorFromBytes(52, 104, 86))
            end
            if tab_map[j][i] == 2 then
                love.graphics.setColor(love.math.colorFromBytes(8, 24, 32))
            end
            if tab_map[j][i] == 3 then
                love.graphics.setColor(love.math.colorFromBytes(136, 192, 112))
            end
            love.graphics.rectangle("fill", (i * TILE_SIZE) - TILE_SIZE, (j * TILE_SIZE) - TILE_SIZE, TILE_SIZE, TILE_SIZE)
        end
    end

    love.graphics.setColor(1, 1, 1)

end



return Map