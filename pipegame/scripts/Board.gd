extends Node2D

class_name	Board

# Create the board
var board = []
func _init():	
	
	for j in range(Global.NB_TILE_Y):
		var row = []
		for i in range (Global.NB_TILE_X):
			var tmp_tile = Tile.new(i, j, 8)
			row.append(tmp_tile)
		board.append(row)
	
	print("Board created")
