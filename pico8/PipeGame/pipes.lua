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
pipes[25] = "full_cross"
pipes[26] = "full_cross"
pipes[17] = "corner_bot_left"
pipes[18] = "corner_bot_left"
pipes[19] = "corner_top_left"
pipes[20] = "corner_top_left"
pipes[22] = "corner_bot_right"
pipes[21] = "corner_bot_right"
pipes[24] = "corner_top_right"
pipes[23] = "corner_top_right"
pipes[33] = "bonus_1"
pipes[49] = "bonus_1"
pipes[34] = "bonus_2"
pipes[50] = "bonus_2"
pipes[52] = "target"

-- connected : top, bot, left, right

pipes["target"] = {}
pipes["target"]["connected"]={1, 1, 1, 1}

pipes["bonus_1"] = {}
pipes["bonus_1"]["tile_wet"]=33
pipes["bonus_1"]["tile_dry"]=49
pipes["bonus_1"]["connected"]={1, 1, 1, 1}

pipes["bonus_2"] = {}
pipes["bonus_2"]["tile_wet"]=34
pipes["bonus_2"]["tile_dry"]=50
pipes["bonus_2"]["connected"]={1, 1, 1, 1}


pipes["start_bot"]={}
pipes["start_bot"]["tile_wet"]=1
pipes["start_bot"]["tile_dry"]=1
pipes["start_bot"]["connected"]={0, 1, 0, 0}

pipes["start_top"]={}
pipes["start_top"]["tile_wet"]=2
pipes["start_top"]["tile_dry"]=2
pipes["start_top"]["connected"]={1, 0, 0, 0}

pipes["start_right"]={}
pipes["start_right"]["tile_wet"]=3
pipes["start_right"]["tile_dry"]=3
pipes["start_right"]["connected"]={0, 0, 0, 1}

pipes["start_left"]={}
pipes["start_left"]["tile_wet"]=4
pipes["start_left"]["tile_dry"]=4
pipes["start_left"]["connected"]={0, 0, 1, 0}

pipes["hori"]={}
pipes["hori"]["tile_dry"]=6
pipes["hori"]["tile_wet"]=5
pipes["hori"]["connected"]={0, 0, 1, 1}


pipes["verti"]={}
pipes["verti"]["tile_dry"]=8
pipes["verti"]["tile_wet"]=7
pipes["verti"]["connected"]={1, 1, 0, 0}


pipes["full_cross"]={}
pipes["full_cross"]["tile_dry"]=10
pipes["full_cross"]["tile_wet"]=9
pipes["full_cross"]["tile_wet_hori"]=25
pipes["full_cross"]["tile_wet_verti"]=26
pipes["full_cross"]["connected"]={1, 1, 1, 1}


pipes["half_cross_hori_wet"]={}
pipes["half_cross_hori_wet"]["tile"]=25
pipes["half_cross_hori_wet"]["connected"]={1, 1, 1, 1}

pipes["half_cross_verti_wet"]={}
pipes["half_cross_verti_wet"]["tile"]=26
pipes["half_cross_verti_wet"]["connected"]={1, 1, 1, 1}

pipes["corner_bot_left"]={}
pipes["corner_bot_left"]["tile_dry"]=18
pipes["corner_bot_left"]["tile_wet"]=17
pipes["corner_bot_left"]["connected"]={1, 0, 0, 1}


pipes["corner_top_left"]={}
pipes["corner_top_left"]["tile_dry"]=20
pipes["corner_top_left"]["tile_wet"]=19
pipes["corner_top_left"]["connected"]={0, 1, 0, 1}

pipes["corner_bot_right"]={}
pipes["corner_bot_right"]["tile_dry"]=21
pipes["corner_bot_right"]["tile_wet"]=22
pipes["corner_bot_right"]["connected"]={1, 0, 1, 0}

pipes["corner_top_right"]={}
pipes["corner_top_right"]["tile_dry"]=23
pipes["corner_top_right"]["tile_wet"]=24
pipes["corner_top_right"]["connected"]={0, 1, 1, 0}
