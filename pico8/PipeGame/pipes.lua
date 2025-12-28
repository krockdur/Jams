pipes = {}

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

pipes["hori_wet"]={}
pipes["hori_wet"]["tile"]=5
pipes["hori_wet"]["connected"]={"left", "right"}

pipes["hori_dry"]={}
pipes["hori_dry"]["tile"]=6
pipes["hori_dry"]["connected"]={"left", "right"}

pipes["verti_wet"]={}
pipes["verti_wet"]["tile"]=7
pipes["verti_wet"]["connected"]={"top", "bot"}

pipes["verti_dry"]={}
pipes["verti_dry"]["tile"]=8
pipes["verti_dry"]["connected"]={"top", "bot"}

pipes["full_cross_wet"]={}
pipes["full_cross_wet"]["tile"]=9
pipes["full_cross_wet"]["connected"]={"top", "bot", "left", "right"}

pipes["full_cross_dry"]={}
pipes["full_cross_dry"]["tile"]=10
pipes["full_cross_dry"]["connected"]={"top", "bot", "left", "right"}

pipes["half_cross_hori_wet"]={}
pipes["half_cross_hori_wet"]["tile"]=25
pipes["half_cross_hori_wet"]["connected"]={"top", "bot", "left", "right"}

pipes["half_cross_verti_wet"]={}
pipes["half_cross_verti_wet"]["tile"]=26
pipes["half_cross_verti_wet"]["connected"]={"top", "bot", "left", "right"}

pipes["corner_bot_left_wet"]={}
pipes["corner_bot_left_wet"]["tile"]=17
pipes["corner_bot_left_wet"]["connected"]={"top", "right"}

pipes["corner_bot_left_dry"]={}
pipes["corner_bot_left_dry"]["tile"]=18
pipes["corner_bot_left_dry"]["connected"]={"top", "right"}

pipes["corner_top_left_wet"]={}
pipes["corner_top_left_wet"]["tile"]=19
pipes["corner_top_left_wet"]["connected"]={"bot", "right"}

pipes["corner_top_left_dry"]={}
pipes["corner_top_left_dry"]["tile"]=20
pipes["corner_top_left_dry"]["connected"]={"bot", "right"}

pipes["corner_bot_right_wet"]={}
pipes["corner_bot_right_wet"]["tile"]=22
pipes["corner_bot_right_wet"]["connected"]={"top", "left"}

pipes["corner_bot_right_dry"]={}
pipes["corner_bot_right_dry"]["tile"]=21
pipes["corner_bot_right_dry"]["connected"]={"top", "left"}

pipes["corner_top_right_wet"]={}
pipes["corner_top_right_wet"]["tile"]=24
pipes["corner_top_right_wet"]["connected"]={"bot", "left"}

pipes["corner_top_right_dry"]={}
pipes["corner_top_right_dry"]["tile"]=23
pipes["corner_top_right_dry"]["connected"]={"bot", "left"}