

-- config file

-- configuration
-- active les traces dans la console
io.stdout:setvbuf('no')

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

screengame_width = 160
screengame_height = 144
screengame_scale = 3
NB_MAP_TILES_X = 50 --199
NB_MAP_TILES_Y = 50 --199
TILE_SIZE = 64
PLAYER_SIZE = 16
ENEMIES_SIZE = 16
BULLET_SIZE = 5

function love.conf(t)
  
  t.window.width = screengame_width*screengame_scale
  t.window.height = screengame_height*screengame_scale
  t.window.highdpi = false
  t.window.fullscreen = false         -- Enable fullscreen (boolean)
  t.window.vsync = 1
  t.window.title = "GBJAM 13"

  t.console = false
  
end
