local Enemies = {}
Enemies.list = {}

local sprite_enemies

-- =================================================================== --

function Enemies.create_an_enemy(case_i, case_j)
    math.randomseed(os.time())
    table.insert(
      Enemies.list,
      {
          c_i = case_i,
          c_j = case_j,
          lvl = 1,
          pv = 10,
          x = (case_i * TILE_SIZE) - TILE_SIZE / 2,
          y = (case_j * TILE_SIZE) - TILE_SIZE / 2,
          a = 0,
          t = math.random(0.1, 1), -- timer rotation
          ct = 0, -- current timer rotation
          scale = 1
      }
    )

end

-- =================================================================== --

function Enemies.pop_and_up_enemies()

  for j = 1, NB_MAP_TILES_Y do
    for i = 1, NB_MAP_TILES_X do
        if tab_events[j][i] == 5 then
          
          local enemy_already_exist = false

          if #Enemies.list  > 0 then
            for index, mob in pairs(Enemies.list) do
              if mob.c_j == j and mob.c_i == i then
                enemy_already_exist = true
                
                mob.lvl = mob.lvl + 1
                mob.pv = mob.pv + 1
                if mob.scale <= 5 then
                   mob.scale = mob.scale + 0.25 
                end
              end
            end
          end
          if enemy_already_exist == false then
            -- Création du mob
            Enemies.create_an_enemy(i, j)
          end

        end
    end
  end


end

-- =================================================================== --

function Enemies.load()
    sprite_enemies = love.graphics.newImage("assets/mouse_top.png")
end

-- =================================================================== --

function Enemies.update(dt)
    
    for i, e in pairs(Enemies.list) do
        e.ct = e.ct + dt
        if e.ct >= e.t then
            e.a = e.a - 0.2 --math.pi/2
            e.ct = 0
        end
    end

end

-- =================================================================== --

function Enemies.draw()
  -- déssiner les enemies
  if #Enemies.list > 0 then

    for i,e in pairs(Enemies.list) do

      love.graphics.setColor(1, 0, 0)
      love.graphics.rectangle()

      love.graphics.setColor(1 , 1 , 1)
      
      love.graphics.draw(
        sprite_enemies,
        e.x,
        e.y,
        e.a,
        e.scale,
        e.scale,
        ENEMIES_SIZE / 2,
        ENEMIES_SIZE / 2
    )
    
    end
  end
end


return Enemies