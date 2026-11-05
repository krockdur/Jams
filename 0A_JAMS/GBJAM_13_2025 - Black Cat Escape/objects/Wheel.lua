
local Wheel = {}

Wheel.bonus_selected = "none"

local sound_tictac
local sound_ding

local wheel_sprite

Wheel.is_running = false
Wheel.is_bonus_select = false

function Wheel.load()

    wheel_sprite = love.graphics.newImage("assets/wheel.png")
    sound_tictac = love.audio.newSource("/assets/tictac.mp3", "static")
    sound_ding = love.audio.newSource("/assets/ding.wav", "static")
    Wheel.is_running = false

end

local arrow_angle = 0
local arrow_x1 = 79
local arrow_y1 = 81
local arrow_x2 = 2
local arrow_y2 = 2
local arrow_win_x2 = 2
local arrow_win_y2 = 2
local arrow_length = 25
local arrow_speed = 15

local top_show_result_timer = 0

local timer_show_result_started = false
function Wheel.update(dt)
    
    if (Wheel.is_running) then
        sound_tictac:play()
        -- Calcul du deuxième point en fonction de l'angle
        arrow_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
        arrow_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length

        arrow_angle = arrow_angle + arrow_speed * dt
        if arrow_angle >= 2 * math.pi then arrow_angle = 0 end

    end

    local current_time = love.timer.getTime()
    if (timer_show_result_started) then
        sound_tictac:stop()
        sound_ding:play()
        if ( (arrow_angle >= 0) and (arrow_angle < math.pi / 4) ) then
            arrow_angle = math.pi / 6
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >=  math.pi / 4) and (arrow_angle < math.pi / 2) ) then
            arrow_angle = math.pi / 3
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >=  math.pi / 2) and (arrow_angle < 3 * math.pi / 4) ) then
            arrow_angle = 2 * math.pi / 3
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >= 3 * math.pi / 4) and (arrow_angle < math.pi)) then
            arrow_angle = 5 * math.pi / 6
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >= math.pi) and (arrow_angle < 5 * math.pi / 4)) then
            arrow_angle = 7 * math.pi / 6
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >= 5 * math.pi / 4) and (arrow_angle < 3 * math.pi / 2)) then
            arrow_angle = 4 * math.pi / 3
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >= 3 * math.pi / 2) and (arrow_angle < 7 * math.pi / 4)) then
            arrow_angle = 5 * math.pi / 3
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        if ( (arrow_angle >= 7 * math.pi / 4) and (arrow_angle < 2*math.pi)) then
            arrow_angle = 11 * math.pi / 6
            arrow_win_x2 = arrow_x1 + math.cos(arrow_angle) * arrow_length
            arrow_win_y2 = arrow_y1 + math.sin(arrow_angle) * arrow_length
        end

        top_show_result_timer = love.timer.getTime()
        timer_show_result_started = false

    end

    if (Wheel.show_result) and (current_time - top_show_result_timer > 2) then
        Wheel.show_result = false
    end
end

function Wheel.draw(top_left_x, top_left_y)

    love.graphics.setColor(1, 1, 1)
    if (Wheel.is_running) then
        love.graphics.push()

        love.graphics.origin()
        love.graphics.draw(wheel_sprite, 0, 0)
        
        love.graphics.setColor(love.math.colorFromBytes(136, 192, 112))
        love.graphics.line(arrow_x1, arrow_y1, arrow_x2, arrow_y2)

        love.graphics.setColor(1, 1, 1)

        love.graphics.pop()
    end

    if (Wheel.show_result) then
        love.graphics.push()

        love.graphics.origin()
        love.graphics.draw(wheel_sprite, 0, 0)
        
        love.graphics.setColor(love.math.colorFromBytes(136, 192, 112))
        love.graphics.line(arrow_x1, arrow_y1, arrow_win_x2, arrow_win_y2)

        love.graphics.setColor(1, 1, 1)

        love.graphics.pop()
    end


end

function Wheel.set_bonus(angle)
    print("------")
    print ("angle : " .. angle)

    if ( (angle >= 0) and (angle < math.pi / 4) ) then
        arrow_angle = math.pi / 6
        --print("F+")
        Wheel.bonus_selected = "F+"
    end

    if ( (angle >=  math.pi / 4) and (angle < math.pi / 2) ) then
        arrow_angle = math.pi / 3
        --print("S-")
        Wheel.bonus_selected = "S-"
    end

    if ( (angle >=  math.pi / 2) and (angle < 3 * math.pi / 4) ) then
        arrow_angle = 2 * math.pi / 3
        --print("Verti")
        Wheel.bonus_selected = "VERTI"
    end

    if ( (angle >= 3 * math.pi / 4) and (angle < math.pi)) then
        arrow_angle = 5 * math.pi / 6
        --print("T-")
        Wheel.bonus_selected = "T-"
    end

    if ( (angle >= math.pi) and (angle < 5 * math.pi / 4)) then
        arrow_angle = 7 * math.pi / 6
        --print("F-")
        Wheel.bonus_selected = "F-"
    end

    if ( (angle >= 5 * math.pi / 4) and (angle < 3 * math.pi / 2)) then
        arrow_angle = 4 * math.pi / 3
        --print("S+")
        Wheel.bonus_selected = "S+"
    end

    if ( (angle >= 3 * math.pi / 2) and (angle < 7 * math.pi / 4)) then
        arrow_angle = 5 * math.pi / 3
        --print("Hori")
        Wheel.bonus_selected = "HORI"
    end

    if ( (angle >= 7 * math.pi / 4) and (angle < 2*math.pi)) then
        arrow_angle = 11 * math.pi / 6
        --print("T+")
        Wheel.bonus_selected = "T+"
    end
end

function Wheel.keypressed(key, scancode, isrepeat)

    if ((key == "a" or key == "q") and Wheel.is_running) then
        Wheel.is_running = false
        Wheel.is_bonus_select = true
        Wheel.set_bonus(arrow_angle)

        Wheel.show_result = true
            timer_show_result_started = true

    end

end




return Wheel