extends Node

var tileMapBoard
var board

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("my pipe game")
	tileMapBoard = get_node("TileMapLayerBoard")
	board = Board.new()
	
	
	# INIT EMPTIES TILES
	for tmp_tile in board.board.values():
		tileMapBoard.set_cell(Vector2i(tmp_tile.pos_i, tmp_tile.pos_j), 1, tmp_tile.type["tile"], tmp_tile.type["alternative_tile"])


	var t_tile_1 = board.get_tile(Vector2(2, 2))

	board.set_tile(Tile.new(2, 2, Global.STARTER_TO_RIGHT_PIPE))
	
	var t_tile_2 = board.get_tile(Vector2(2, 2))
	
	print("debug")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("clic_gauche"):
		print(tileMapBoard.local_to_map( get_viewport().get_mouse_position() ))
		tileMapBoard.set_cell(tileMapBoard.local_to_map( get_viewport().get_mouse_position() ), 1, Global.CORNER_TOP_LEFT_PIPE.tile, Global.CORNER_TOP_LEFT_PIPE.alternative_tile)
	
