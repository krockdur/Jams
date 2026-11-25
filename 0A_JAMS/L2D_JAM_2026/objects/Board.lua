local Board = {}

local Card = require('objects.Card')

Board.nb_card_x = 10
Board.nb_card_y = 4

Board.grid = {}

-- =================================================================== --

function Board.load()

    for j = 1, Board.nb_card_y do
        Board.grid_status[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_status[j][i] = {

            }
        end
    end

end

-- =================================================================== --

function Board.update(dt)

end

-- =================================================================== --

function Board.draw()

end

-- =================================================================== --.





-- =================================================================== --

return Board