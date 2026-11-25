local Card = {}
Card.__index = Card

function Card.new(card_type)
    local self = setmetatable({}, Card)

    self.type = card_type or 0
    self.status = 0
    self.is_reveal = false
    self.animation_state = 0

    return self
end

function Card:reveal()
    self.is_reveal = true
    self.status = 1
end

function Card:update(dt)
    -- Exemple : faire avancer animation_state si besoin
end

return Card