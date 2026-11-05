extends Node2D

class_name	Board

# Create the board
var board = {}

func _init():	
	var index = 0
	for j in range(Global.NB_TILE_Y):
		for i in range (Global.NB_TILE_X):
			var tmp_tile = Tile.new(i, j, Global.EMPTY_PIPE)			
			board[index] = tmp_tile
			index+=1
	print("Board created")

# Update a Tile
func set_tile(tile: Tile):
	board[get_tile_key(Vector2i(tile.pos_i, tile.pos_j))] = tile

#Get a Tile
func get_tile(pos: Vector2i) -> Tile:
	var ret_tile = board[get_tile_key(pos)]	
	return ret_tile
	
func get_tile_key(pos: Vector2i) -> int:
	var id = -1
	for tmp_tile in board.values():
		if ( tmp_tile.pos_i == pos.x && tmp_tile.pos_j == pos.y ):
			id = board.find_key(tmp_tile)
	return id
	
