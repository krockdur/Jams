extends Node

var tileMapBoard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("my pipe game")
	tileMapBoard = get_node("TileMapLayerBoard")
	var board = Board.new()
	
	
	for j in range(Global.NB_TILE_Y):
		for i in range (Global.NB_TILE_X):
			tileMapBoard.set_cell(Vector2i(i * 64, j * 64), 1, Global.EMPTY_PIPE["tile"], Global.EMPTY_PIPE["alternative_tile"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
