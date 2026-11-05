-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

print("coucou")
local config = {}

config.ENEMY_WIDTH = 40
config.TIME_BETWEEN_ENEMY_POP = 1.2
config.TIME_BETWEEN_ENEMY_POP_HARD = 3.5
config.TIME_BETWEEN_BOSS_POP = 35
config.PRETIME_BOSS_POP = 5

config.TIME_LOSE_PER_HURT = 3
config.TIME_LOSE_PER_EARTH_HURT = 8

config.ENEMY_SPEED = 50

config.TYPE_ENEMY_YELLOW = 1
config.TYPE_ENEMY_GREEN = 2
config.TYPE_ENEMY_WHITE = 3
config.TYPE_ENEMY_RED = 4
config.TYPE_ENEMY_BOSS = 5

config.MAX_PLAYER_TIME = 30

config.BONUS_SHOOT_1_LENGTH = 10

return config