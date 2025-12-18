extends Node

var TextureRectPipe1
var TextureRectPipe2
var TextureRectPipe3


func _ready() -> void:
	TextureRectPipe1 = get_node("TextureRectPipe1")
	TextureRectPipe2 = get_node("TextureRectPipe2")
	TextureRectPipe3 = get_node("TextureRectPipe3")
	
	TextureRectPipe1.texture = load("res://assets/hud_pipes/pipe_horizontal.tres")
	TextureRectPipe2.texture = load("res://assets/hud_pipes/pipe_horizontal.tres")
	TextureRectPipe3.texture = load("res://assets/hud_pipes/pipe_horizontal.tres")
	
