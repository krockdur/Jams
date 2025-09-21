local Enemies = {}
Enemies.list = {}

Enemies.tab_bullets = {}
Enemies.shoot_interval = 0.2 -- en secondes
Enemies.shoot_speed = 400
Enemies.fire_length = 60

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
          scale = 1,
          can_fire = true,
          type_fire = 1,    -- 1=left 2=right 3=left+right
          move_type = 1     -- 1=rotation 2= top down 3=zig zag
      }
    )

end

-- =================================================================== --

function Enemies.pop_and_up_enemies()

  for j = 1, NB_MAP_TILES_Y do
    for i = 1, NB_MAP_TILES_X do
        if tab_enemies[j][i] == 33 then
          
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
    
  -- Mouvement
  for i, e in pairs(Enemies.list) do
      e.ct = e.ct + dt
      if e.ct >= e.t then
          e.a = e.a - 0.2 --math.pi/2
          e.ct = 0
      end
  end

  -- tirs
  Enemies.shoot(dt)
  Enemies.move_shoots(dt)
end

-- =================================================================== --
-- offset - scale - rotation
function Enemies.draw()

  Enemies.draw_enemies()
  Enemies.draw_bullets()

end

-- =================================================================== --

function Enemies.draw_enemies()
  if #Enemies.list > 0 then

    for i,e in pairs(Enemies.list) do

      --love.graphics.push()
      --love.graphics.translate(-ENEMIES_SIZE / 2, -ENEMIES_SIZE / 2)
      --love.graphics.setColor(0, 1, 0)
      --love.graphics.rectangle("line", e.x, e.y, ENEMIES_SIZE , ENEMIES_SIZE)
      --love.graphics.pop()

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

-- =================================================================== --

function Enemies.draw_bullets()
  
  for j,b in pairs(Enemies.tab_bullets) do
    love.graphics.setColor(love.math.colorFromBytes(8, 24, 32))
    love.graphics.rectangle("fill", b.x, b.y, 5, 5)
    love.graphics.setColor(love.math.colorFromBytes(136, 192, 112))
    love.graphics.rectangle("fill", b.x + 1, b.y + 1, 3, 3)
  end
end

-- =================================================================== --

-- déplace les tirs énnemies
function Enemies.move_shoots(dt)
  -- DEPLACEMENT DES BULLETS
  for j,b in pairs(Enemies.tab_bullets) do

    -- si la bullet sort de l'écran
    local fire_length = 150
    if  b.x > b.x_fire_start + Enemies.fire_length or 
        b.x < b.x_fire_start - Enemies.fire_length or
        b.y > b.y_fire_start + Enemies.fire_length or
        b.y < b.y_fire_start - Enemies.fire_length then
      table.remove(Enemies.tab_bullets, j)
    end

    if b.type_fire == 1 then
      b.x = b.x - Enemies.shoot_speed * dt
    end
    if b.type_fire == 2 then
      b.x = b.x + Enemies.shoot_speed * dt
    end
  end
end

-- =================================================================== --

-- Ajoute les tirs énnemies dans tab_bullets
local timerShooter = 0
function Enemies.shoot(dt)
  timerShooter = timerShooter + dt
  if timerShooter >= Enemies.shoot_interval then
    for i, e in pairs(Enemies.list) do

      if e.type_fire ~= 0 then
        table.insert(Enemies.tab_bullets, {

          x = e.x + ENEMIES_SIZE / 2,
          y = e.y,
          speed = Enemies.shoot_speed,
          x_fire_start = e.x + ENEMIES_SIZE / 2,
          y_fire_start = e.y,
          type_fire = e.type_fire
    
        })

      end
    end
    timerShooter = 0
  end
end


return Enemies