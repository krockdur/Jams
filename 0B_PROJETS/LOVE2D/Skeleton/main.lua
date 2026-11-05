-- main.lua


local GameObject = require("gameobjects/GameObject")


local thorin = GameObject.new("Thorin", 100, 12)
local azog = GameObject.new("Azog", 120, 15)


thorin:attaquer(azog)