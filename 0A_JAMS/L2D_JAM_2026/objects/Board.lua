local Board = {}

-- board description
Board.grid_status = {}  --représente l'état du plateau
Board.grid_to_draw = {} --représente les carte à afficher
Board.nb_card_x = 10
Board.nb_card_y = 4

-- cards description
Board.cards = {}

Board.cards.type.back = 0
Board.cards.type.block = 1
Board.cards.type.damage_X1 = 2
Board.cards.type.damage_X2 = 3
Board.cards.type.damage_X3 = 4
Board.cards.type.not_lucky = 5





-- =================================================================== --

function Board.InitGrid()

    --randoms :
    local nb_cards_block = 8
    local nb_cards_damage_x1 = 8
    local nb_cards_damage_x2 = 8
    local nb_cards_damage_x3 = 8
    local nb_cards_not_lucky = 8
    --block
    --damage X1
    --damage X2
    --damage X3
    --not lucky

    for j = 1, Board.nb_card_y do
        Board.grid_status[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_status[j][i] = {
                0,  --type carte
                0,  --0 = caché / 1 = découverte
                0   --1 = paire découverte
            }
        end
    end

    for e = 1, nb_cards_block do
        local rx = math.random(1, 10)
        local ry = math.random(1, 4)
    end


    for j = 1, Board.nb_card_y do
        Board.grid_to_draw[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_to_draw[j][i] = Board.cards.back
        end
    end
end

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
    Board.InitGrid()
end

-- =================================================================== --

function Board.update(dt)

end

-- =================================================================== --

function Board.draw()
    for j = 1, Board.nb_card_y do
        for i = 1, Board.nb_card_x do
            local sprite_to_draw
            if Board.grid_to_draw[j][i] == 0 then
                sprite_to_draw = Board.type.spr_card_back
            elseif Board.grid_to_draw[j][i] == 1 then
                sprite_to_draw = Board.type.spr_card_block
            elseif Board.grid_to_draw[j][i] == 2 then
                sprite_to_draw = Board.type.spr_card_damage_X1
            elseif Board.grid_to_draw[j][i] == 3 then
                sprite_to_draw = Board.type.spr_card_damage_X2
            elseif Board.grid_to_draw[j][i] == 4 then
                sprite_to_draw = Board.type.spr_card_damage_X3
            elseif Board.grid_to_draw[j][i] == 5 then
                sprite_to_draw = Board.type.spr_card_not_lucky
            end
            love.graphics.draw(sprite_to_draw, 117.5 + ((i - 1) * 75), 140 + (j - 1) * 100)
        end
    end
end

return Board
