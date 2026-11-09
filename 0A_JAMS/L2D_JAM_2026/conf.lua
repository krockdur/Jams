

-- config file

-- configuration
-- active les traces dans la console
io.stdout:setvbuf('no')

if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.conf(t)
  
  t.window.width = 960
  t.window.height = 540
  t.window.highdpi = false
  t.window.fullscreen = false         -- Enable fullscreen (boolean)
  t.window.vsync = 1 
    
  t.window.title = "LOVE2D JAM 2026 B-SIDE"

  t.console = true
  
end
