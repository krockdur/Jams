local Board = {}

-- board description
Board.grid = {}
Board.nb_card_x = 10
Board.nb_card_y = 4

-- cards description
Board.cards = {}
Board.cards.back = 0
Board.cards.block = 1
Board.cards.damage_X1 = 2
Board.cards.damage_X2 = 3
Board.cards.damage_X3 = 4
Board.cards.not_lucky = 5


-- =================================================================== --

function Board.load()
    -- sprites
    Board.spr_card_back = love.graphics.newImage("Assets/back.png")
    Board.spr_card_block = love.graphics.newImage("Assets/block.png")
    Board.spr_card_damage_X1 = love.graphics.newImage("Assets/damage_X1.png")
    Board.spr_card_damage_X2 = love.graphics.newImage("Assets/damage_X2.png")
    Board.spr_card_damage_X3 = love.graphics.newImage("Assets/damage_X3.png")
    Board.spr_card_not_lucky = love.graphics.newImage("Assets/not_lucky.png")

    -- init board grid game
    for j = 1, Board.nb_card_y do
        Board.grid[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid[j][i] = Board.cards.back
        end
    end
end

-- =================================================================== --

function Board.update(dt)

end

-- =================================================================== --

function Board.draw()
    for j = 1, Board.nb_card_y do
        for i = 1, Board.nb_card_x do
            local sprite_to_draw
            if Board.grid[j][i] == 0 then
                sprite_to_draw = Board.spr_card_back
            elseif Board.grid[j][i] == 1 then
                sprite_to_draw = Board.spr_card_block
            elseif Board.grid[j][i] == 2 then
                sprite_to_draw = Board.spr_card_damage_X1
            elseif Board.grid[j][i] == 3 then
                sprite_to_draw = Board.spr_card_damage_X2
            elseif Board.grid[j][i] == 4 then
                sprite_to_draw = Board.spr_card_damage_X3
            elseif Board.grid[j][i] == 5 then
                sprite_to_draw = Board.spr_card_not_lucky
            end
            love.graphics.draw(sprite_to_draw, 117.5 + ((i - 1) * 75), 140 + (j - 1) * 100)
        end
    end
end

return Board
