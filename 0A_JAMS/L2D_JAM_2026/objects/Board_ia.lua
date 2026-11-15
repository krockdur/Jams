local Board = {}

-- board description
Board.grid_status = {}  -- représente l'état du plateau
Board.grid_to_draw = {} -- représente les cartes à afficher
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

-- contient la description des animations
Board.animations = {
    card_block = { row = 1, frames = 8, duration = 0.5 },
    card_damage_x1 = { row = 2, frames = 8, duration = 0.5 },
    card_damage_x2 = { row = 3, frames = 8, duration = 0.5 },
    card_damage_x3 = { row = 4, frames = 8, duration = 0.5 },
    card_not_lucky = { row = 5, frames = 8, duration = 0.5 }
}

-- contient les sprites des animations
Board.tab_spr_animation = {}
Board.tab_spr_animation.anim_card_block = {}
Board.tab_spr_animation.anim_card_damage_X1 = {}
Board.tab_spr_animation.anim_card_damage_X2 = {}
Board.tab_spr_animation.anim_card_damage_X3 = {}
Board.tab_spr_animation.anim_card_not_lucky = {}

-- Variables de contrôle du jeu
local card_1_clicked = nil -- contient {x, y}
local card_2_clicked = nil -- contient {x, y}
local waiting_for_match_check = false
local pause_timer = 0

-- =================================================================== --
function Board.randomize_grid(nb_cards, card_type)
    for e = 1, nb_cards do
        local success = false

        while not success do
            local rx = math.random(1, 10)
            local ry = math.random(1, 4)

            if Board.grid_status[ry][rx][1] == 0 then
                Board.grid_status[ry][rx] = {
                    card_type, -- 1: type carte
                    0,         -- 2: 0 = caché / 1 = découverte
                    0,         -- 3: 1 = paire découverte
                    1,         -- 4: frame actuelle de l'animation (1 à 8)
                    0,         -- 5: sens de l'animation (1 = révélation 1->8, -1 = masquage 8->1, 0 = statique)
                    0          -- 6: timer interne pour la frame
                }
                success = true
            end
        end
    end
end

-- =================================================================== --
function Board.InitGrid()
    local nb_cards_block = 8
    local nb_cards_damage_x1 = 8
    local nb_cards_damage_x2 = 8
    local nb_cards_damage_x3 = 8
    local nb_cards_not_lucky = 8

    for j = 1, Board.nb_card_y do
        Board.grid_status[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_status[j][i] = {
                0, -- type carte
                0, -- 0 = caché / 1 = découverte
                0, -- 1 = paire découverte
                1, -- frame (1)
                0, -- direction (0 = immobile)
                0  -- timer
            }
        end
    end

    Board.randomize_grid(nb_cards_block, Board.cards.type.block)
    Board.randomize_grid(nb_cards_damage_x1, Board.cards.type.damage_X1)
    Board.randomize_grid(nb_cards_damage_x2, Board.cards.type.damage_X2)
    Board.randomize_grid(nb_cards_damage_x3, Board.cards.type.damage_X3)
    Board.randomize_grid(nb_cards_not_lucky, Board.cards.type.not_lucky)
end

-- =================================================================== --
function Board.init_grid_to_draw()
    for j = 1, Board.nb_card_y do
        Board.grid_to_draw[j] = {}
        for i = 1, Board.nb_card_x do
            Board.grid_to_draw[j][i] = Board.cards.type.back
        end
    end
end

-- =================================================================== --
function Board.update_grid_to_draw()
    -- Géré dynamiquement par l'animation et le statut
end

-- =================================================================== --
function Board.load()
    Board.spr_tileset = love.graphics.newImage("Assets/tileset.png")
    local imgWidth, imgHeight = Board.spr_tileset:getDimensions()

    for i = 1, 8 do
        Board.tab_spr_animation.anim_card_block[i] = love.graphics.newQuad((i - 1) * 50, 0, 50, 75, imgWidth, imgHeight)
        Board.tab_spr_animation.anim_card_damage_X1[i] = love.graphics.newQuad((i - 1) * 50, 75, 50, 75, imgWidth, imgHeight)
        Board.tab_spr_animation.anim_card_damage_X2[i] = love.graphics.newQuad((i - 1) * 50, 150, 50, 75, imgWidth, imgHeight)
        Board.tab_spr_animation.anim_card_damage_X3[i] = love.graphics.newQuad((i - 1) * 50, 225, 50, 75, imgWidth, imgHeight)
        Board.tab_spr_animation.anim_card_not_lucky[i] = love.graphics.newQuad((i - 1) * 50, 300, 50, 75, imgWidth, imgHeight)
    end

    Board.InitGrid()
    Board.init_grid_to_draw()
end

-- =================================================================== --
function Board.update(dt)
    for j = 1, Board.nb_card_y do
        for i = 1, Board.nb_card_x do
            local cell = Board.grid_status[j][i]
            local direction = cell[5]

            if direction ~= 0 then
                -- Récupère la durée depuis la table Board.animations selon le type de carte
                local anim_info = Board.animations.card_block -- par défaut
                local c_type = cell[1]
                if c_type == Board.cards.type.damage_X1 then anim_info = Board.animations.card_damage_x1
                elseif c_type == Board.cards.type.damage_X2 then anim_info = Board.animations.card_damage_x2
                elseif c_type == Board.cards.type.damage_X3 then anim_info = Board.animations.card_damage_x3
                elseif c_type == Board.cards.type.not_lucky then anim_info = Board.animations.card_not_lucky end

                local frame_duration = anim_info.duration / anim_info.frames

                cell[6] = cell[6] + dt
                if cell[6] >= frame_duration then
                    cell[6] = 0
                    cell[4] = cell[4] + direction

                    if cell[4] > 8 then
                        cell[4] = 8
                        cell[5] = 0
                        cell[2] = 1
                        if waiting_for_match_check then
                            Board.check_match()
                        end
                    elseif cell[4] < 1 then
                        cell[4] = 1
                        cell[5] = 0
                        cell[2] = 0
                    end
                end
            end
        end
    end

    if pause_timer > 0 then
        pause_timer = pause_timer - dt
        if pause_timer <= 0 then
            if card_1_clicked then Board.grid_status[card_1_clicked.y][card_1_clicked.x][5] = -1 end
            if card_2_clicked then Board.grid_status[card_2_clicked.y][card_2_clicked.x][5] = -1 end
            card_1_clicked = nil
            card_2_clicked = nil
        end
    end
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
            local cell = Board.grid_status[j][i]
            local c_type = cell[1]
            local frame = math.floor(cell[4])
            local sprite_to_draw

            -- Choix du tableau de sprites selon le type de carte
            local anim_table = Board.tab_spr_animation.anim_card_block
            if c_type == Board.cards.type.damage_X1 then
                anim_table = Board.tab_spr_animation.anim_card_damage_X1
            elseif c_type == Board.cards.type.damage_X2 then
                anim_table = Board.tab_spr_animation.anim_card_damage_X2
            elseif c_type == Board.cards.type.damage_X3 then
                anim_table = Board.tab_spr_animation.anim_card_damage_X3
            elseif c_type == Board.cards.type.not_lucky then
                anim_table = Board.tab_spr_animation.anim_card_not_lucky
            end

            sprite_to_draw = anim_table[frame]

            love.graphics.draw(Board.spr_tileset, sprite_to_draw, 
                x_first_card + ((i - 1) * (card_width + card_interval)),
                y_first_card + (j - 1) * (card_height + card_interval))
        end
    end
end

-- =================================================================== --
function Board.is_card_clicked(x, y)
    -- Si on est en train de patienter ou qu'une animation globale bloque, on ignore les clics
    if pause_timer > 0 or waiting_for_match_check then return end

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

-- =================================================================== --
function Board.click_card(x, y)
    local cell = Board.grid_status[y][x]

    -- On ne peut cliquer que sur une carte cachée (frame == 1 et direction == 0)
    if cell[2] == 0 and cell[5] == 0 then
        -- Lancer l'animation de révélation (1 à 8)
        cell[5] = 1 

        if not card_1_clicked then
            card_1_clicked = {x = x, y = y}
        elseif not card_2_clicked and (x ~= card_1_clicked.x or y ~= card_1_clicked.y) then
            card_2_clicked = {x = x, y = y}
            waiting_for_match_check = true -- On attend la fin de l'anim de cette 2ème carte pour vérifier
        end
    end
end

-- =================================================================== --
function Board.check_match()
    waiting_for_match_check = false

    if card_1_clicked and card_2_clicked then
        local c1 = Board.grid_status[card_1_clicked.y][card_1_clicked.x]
        local c2 = Board.grid_status[card_2_clicked.y][card_2_clicked.x]

        if c1[1] == c2[1] then
            -- IDENTIQUES : On valide la paire définitivement
            c1[3] = 1
            c2[3] = 1
            card_1_clicked = nil
            card_2_clicked = nil
        else
            -- DIFFERENTES : On attend un court instant (ex: 0.5 sec) avant de lancer l'animation de retournement inverse
            pause_timer = 0.5 
        end
    end
end

-- =================================================================== --
function Board.mousepressed(x, y, button, istouch)
    Board.is_card_clicked(x, y)

    if button == 2 then
        print("debug")
        Board.debug_print_grid()
    end
end

-- =================================================================== --
function Board.debug_print_grid()
    print(" ")
    print("=== ÉTAT DE LA GRILLE (4 lignes x 10 colonnes) ===")
    for j = 1, Board.nb_card_y do
        local row_str = ""
        for i = 1, Board.nb_card_x do
            local cell = Board.grid_status[j][i]
            row_str = row_str .. string.format("[%d,f:%d,dir:%d] ", cell[1], cell[4], cell[5])
        end
        print("Ligne " .. j .. " : " .. row_str)
    end
    print("==================================================")
end

return Board