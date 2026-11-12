local Board = {}

-- board description
Board.grid_status = {}  --représente l'état du plateau
Board.grid_to_draw = {} --représente les carte à afficher
Board.nb_card_x = 10
Board.nb_card_y = 4

-- cards description
Board.cards = {}

Board.cards.type = {}
Board.cards.type.back = 0
Board.cards.type.block = 1
Board.cards.type.damage_X1 = 2
Board.cards.type.damage_X2 = 3
Board.cards.type.damage_X3 = 4
Board.cards.type.not_lucky = 5





-- =================================================================== --

function Board.randomize_grid(nb_cards, card_type)
    for e = 1, nb_cards do
        local success = false

        while not success do
            local rx = math.random(1, 10)
            local ry = math.random(1, 4)

            if Board.grid_status[ry][rx][1] == 0 then
                Board.grid_status[ry][rx] = {
                    card_type, --type carte
                    0,         --0 = caché / 1 = découverte
                    0          --1 = paire découverte
                }
                success = true
            end
        end
    end
end

function Board.InitGrid()
    --randoms :
    local nb_cards_block = 8
    local nb_cards_damage_x1 = 8
    local nb_cards_damage_x2 = 8
    local nb_cards_damage_x3 = 8
    local nb_cards_not_lucky = 8

    -- init
    for j = 1, Board.nb_card_y do
        Board.grid_status[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_status[j][i] = {
                0, --type carte
                0, --0 = caché / 1 = découverte
                0  --1 = paire découverte
            }
        end
    end

    Board.randomize_grid(nb_cards_block, Board.cards.type.block)
    Board.randomize_grid(nb_cards_damage_x1, Board.cards.type.damage_X1)
    Board.randomize_grid(nb_cards_damage_x2, Board.cards.type.damage_X2)
    Board.randomize_grid(nb_cards_damage_x3, Board.cards.type.damage_X3)
    Board.randomize_grid(nb_cards_not_lucky, Board.cards.type.not_lucky)
end

function Board.init_grid_to_draw()
    for j = 1, Board.nb_card_y do
        Board.grid_to_draw[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_to_draw[j][i] = Board.cards.type.back
        end
    end
end

function Board.update_grid_to_draw()
    for j = 1, Board.nb_card_y do
        for i = 1, Board.nb_card_x do
            --
            if Board.grid_status[j][i][2] == 0 then
                Board.grid_to_draw[j][i] = Board.cards.type.back
                --
            elseif Board.grid_status[j][i][2] == 1 and Board.grid_status[j][i][1] == 1 then
                Board.grid_to_draw[j][i] = Board.cards.type.block
                --
            elseif Board.grid_status[j][i][2] == 1 and Board.grid_status[j][i][1] == 2 then
                Board.grid_to_draw[j][i] = Board.cards.type.damage_X1
                --
            elseif Board.grid_status[j][i][2] == 1 and Board.grid_status[j][i][1] == 3 then
                Board.grid_to_draw[j][i] = Board.cards.type.damage_X2
                --
            elseif Board.grid_status[j][i][2] == 1 and Board.grid_status[j][i][1] == 4 then
                Board.grid_to_draw[j][i] = Board.cards.type.damage_X3
                --
            elseif Board.grid_status[j][i][2] == 1 and Board.grid_status[j][i][1] == 5 then
                Board.grid_to_draw[j][i] = Board.cards.type.not_lucky
                --
            end
        end
    end
end

-- =================================================================== --

function Board.load()
    -- sprites
    Board.spr_tileset = love.graphics.newImage("Assets/tileset.png")
    local imgWidth, imgHeight = Board.spr_tileset:getDimensions()


    Board.spr_card_back = love.graphics.newQuad(0, 0, 50, 75, imgWidth, imgHeight)
    Board.spr_card_block = love.graphics.newQuad(350, 0, 50, 75, imgWidth, imgHeight)
    Board.spr_card_damage_X1 = love.graphics.newQuad(350, 75, 50, 75, imgWidth, imgHeight)
    Board.spr_card_damage_X2 = love.graphics.newQuad(350, 150, 50, 75, imgWidth, imgHeight)
    Board.spr_card_damage_X3 = love.graphics.newQuad(350, 225, 50, 75, imgWidth, imgHeight)
    Board.spr_card_not_lucky = love.graphics.newQuad(350, 300, 50, 75, imgWidth, imgHeight)

    Board.anim_card_block = {}
    Board.anim_card_damage_X1 = {}
    Board.anim_card_damage_X2 = {}
    Board.anim_card_damage_X3 = {}
    Board.anim_card_not_lucky = {}
    for i = 1, 8 do
        Board.anim_card_block[i] = love.graphics.newQuad((i - 1) * 50, 0, 50, 75, imgWidth, imgHeight)
        Board.anim_card_block[i] = love.graphics.newQuad((i - 1) * 50, 0, 50, 75, imgWidth, imgHeight)
        Board.anim_card_block[i] = love.graphics.newQuad((i - 1) * 50, 0, 50, 75, imgWidth, imgHeight)
        Board.anim_card_block[i] = love.graphics.newQuad((i - 1) * 50, 0, 50, 75, imgWidth, imgHeight)
        Board.anim_card_block[i] = love.graphics.newQuad((i - 1) * 50, 0, 50, 75, imgWidth, imgHeight)
    end



    -- init board grid game
    Board.InitGrid()
    Board.init_grid_to_draw()

    Board.update_grid_to_draw()
end

-- =================================================================== --

function Board.update(dt)
    Board.update_grid_to_draw()
end

-- =================================================================== --
local x_first_card = 115.5
local y_first_card = 140
local card_width = 50
local card_height = 75
local card_interval = 25


function Board.draw()
    for j = 1, Board.nb_card_y do
        for i = 1, Board.nb_card_x do
            local sprite_to_draw
            --
            if Board.grid_to_draw[j][i] == 0 then
                sprite_to_draw = Board.spr_card_back
                --
            elseif Board.grid_to_draw[j][i] == 1 then
                sprite_to_draw = Board.spr_card_block
                --
            elseif Board.grid_to_draw[j][i] == 2 then
                sprite_to_draw = Board.spr_card_damage_X1
                --
            elseif Board.grid_to_draw[j][i] == 3 then
                sprite_to_draw = Board.spr_card_damage_X2
                --
            elseif Board.grid_to_draw[j][i] == 4 then
                sprite_to_draw = Board.spr_card_damage_X3
                --
            elseif Board.grid_to_draw[j][i] == 5 then
                sprite_to_draw = Board.spr_card_not_lucky
                --
            end
            --
            love.graphics.draw(Board.spr_tileset, sprite_to_draw, x_first_card + ((i - 1) * (card_width + card_interval)),
                y_first_card + (j - 1) * (card_height + card_interval))
        end
    end
end

-- =================================================================== --

local card_1_clicked = false
local card_1_clicked_x = 0
local card_1_clicked_y = 0

local card_2_clicked = false
local card_2_clicked_x = 0
local card_2_clicked_y = 0


function Board.is_card_clicked(x, y)
    for j = 1, Board.nb_card_y do
        for i = 1, Board.nb_card_x do
            if x > x_first_card + (card_width + card_interval) * (i - 1)
                and x < x_first_card + card_width + (card_width + card_interval) * (i - 1)
                and y > y_first_card + (card_height + card_interval) * (j - 1)
                and y < y_first_card + card_height + (card_height + card_interval) * (j - 1)
            then
                Board.click_card(i, j)
                return
            end
        end
    end
end

function Board.click_card(x, y)
    if Board.grid_status[y][x][2] == 0 then
        Board.grid_status[y][x][2] = 1

        if not card_1_clicked and not card_2_clicked then
            card_1_clicked = true
            card_1_clicked_x = x
            card_1_clicked_y = y
        elseif card_1_clicked and not card_2_clicked then
            card_2_clicked = true
            card_2_clicked_x = x
            card_2_clicked_y = y
        end

        -- Est ce que les deux cartes sont identiques
        if card_1_clicked and card_2_clicked then
            -- IDENTIQUES
            if Board.grid_status[card_1_clicked_y][card_1_clicked_x][1] == Board.grid_status[card_2_clicked_y][card_2_clicked_x][1] then
                -- on les marque comme découverte
                Board.grid_status[card_1_clicked_y][card_1_clicked_x][3] = 1
                Board.grid_status[card_2_clicked_y][card_2_clicked_x][3] = 1

                card_1_clicked = false
                card_2_clicked = false

                -- DIFFERENTES
            else
                -- on les masque
                Board.grid_status[card_1_clicked_y][card_1_clicked_x][2] = 0
                Board.grid_status[card_2_clicked_y][card_2_clicked_x][2] = 0

                card_1_clicked = false
                card_2_clicked = false
            end
        end
    end
end

function Board.flip_card(x, y)

end

---------------------------------------------------

function Board.mousepressed(x, y, button, istouch)
    Board.is_card_clicked(x, y)

    if button == 2 then
        print("debug")
        Board.debug_print_grid()
    end
end

---------------------------------------------------

function Board.debug_print_grid()
    print(" ")
    print("card 1 clicked : " .. tostring(card_1_clicked))
    print("card 2 clicked : " .. tostring(card_2_clicked))
    print(" ")
    print("=== ÉTAT DE LA GRILLE (4 lignes x 10 colonnes) ===")
    for j = 1, Board.nb_card_y do
        local row_str = ""
        for i = 1, Board.nb_card_x do
            local cell = Board.grid_status[j][i]
            -- On formate chaque cellule pour garder un affichage aligné
            row_str = row_str .. string.format("[%d,%d,%d] ", cell[1], cell[2], cell[3])
        end
        print("Ligne " .. j .. " : " .. row_str)
    end
    print("==================================================")
end

return Board
