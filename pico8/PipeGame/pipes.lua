pipes = {}

pipes[1] = "start_bot"
pipes[2] = "start_top"
pipes[3] = "start_right"
pipes[4] = "start_left"
pipes[5] = "hori"
pipes[6] = "hori"
pipes[7] = "verti"
pipes[8] = "verti"
pipes[9] = "full_cross"
pipes[10] = "full_cross"
pipes[25] = "half_cross_hori_wet"
pipes[26] = "half_cross_verti_wet"
pipes[17] = "corner_bot_left"
pipes[18] = "corner_bot_left"
pipes[19] = "corner_top_left"
pipes[20] = "corner_top_left"
pipes[22] = "corner_bot_right"
pipes[21] = "corner_bot_right"
pipes[24] = "corner_top_right"
pipes[23] = "corner_top_right"

pipes["start_bot"]={}
pipes["start_bot"]["tile"]=1
pipes["start_bot"]["connected"]={"bot"}

pipes["start_top"]={}
pipes["start_top"]["tile"]=2
pipes["start_top"]["connected"]={"top"}

pipes["start_right"]={}
pipes["start_right"]["tile"]=3
pipes["start_right"]["connected"]={"right"}

pipes["start_left"]={}
pipes["start_left"]["tile"]=4
pipes["start_left"]["connected"]={"left"}

pipes["hori"]={}
pipes["hori"]["tile_dry"]=6
pipes["hori"]["tile_wet"]=5
pipes["hori"]["connected"]={"left", "right"}


pipes["verti"]={}
pipes["verti"]["tile_dry"]=8
pipes["verti"]["tile_wet"]=7
pipes["verti"]["connected"]={"top", "bot"}


pipes["full_cross"]={}
pipes["full_cross"]["tile_dry"]=10
pipes["full_cross"]["tile_wet"]=9
pipes["full_cross"]["connected"]={"top", "bot", "left", "right"}


pipes["half_cross_hori_wet"]={}
pipes["half_cross_hori_wet"]["tile"]=25
pipes["half_cross_hori_wet"]["connected"]={"top", "bot", "left", "right"}

pipes["half_cross_verti_wet"]={}
pipes["half_cross_verti_wet"]["tile"]=26
pipes["half_cross_verti_wet"]["connected"]={"top", "bot", "left", "right"}

pipes["corner_bot_left"]={}
pipes["corner_bot_left"]["tile_dry"]=18
pipes["corner_bot_left"]["tile_wet"]=17
pipes["corner_bot_left"]["connected"]={"top", "right"}


pipes["corner_top_left"]={}
pipes["corner_top_left"]["tile_dry"]=20
pipes["corner_top_left"]["tile_wet"]=19
pipes["corner_top_left"]["connected"]={"bot", "right"}

pipes["corner_bot_right"]={}
pipes["corner_bot_right"]["tile_dry"]=21
pipes["corner_bot_right"]["tile_wet"]=22
pipes["corner_bot_right"]["connected"]={"top", "left"}

pipes["corner_top_right"]={}
pipes["corner_top_right"]["tile_dry"]=23
pipes["corner_top_right"]["tile_wet"]=24
pipes["corner_top_right"]["connected"]={"bot", "left"}
